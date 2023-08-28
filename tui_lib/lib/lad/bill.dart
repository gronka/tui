import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'bill.g.dart';

class BillProxy {
  BillProxy({
    required this.billCache,
    required this.king,
  });
  final Cache<Bill> billCache;
  final King king;

  Bill getById(
    String billId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      billCache.apiGetById(
          url: EndpointsV2.billGetById,
          idName: 'BillId',
          id: billId,
          forceApi: forceApi);
    }

    return billCache.getItem(billId);
  }

  static BillProxy of(BuildContext context) {
    return King.of(context).lad.billProxy;
  }
}

class Bill = BillBase with _$Bill;

abstract class BillBase with Store {
  @observable
  String billId = '';
  @observable
  String billType = '';
  @observable
  List<String> chargeIds = [];
  @observable
  int creditApplied = 0;
  @observable
  int creditOverflow = 0;
  @observable
  String currency = '';
  @observable
  String notes = '';
  @observable
  int period = 0;
  @observable
  int price = 0;
  @observable
  String probiusId = '';
  @observable
  String status = '';
  @observable
  int timeCreated = 0;
  @observable
  bool wasAutopayUsed = false;

  bool isLoaded = false;

  static Bill unpackById(Map<String, dynamic> body, Bill tt) {
    tt.billId = readString(body, 'BillId');
    tt.billType = readString(body, 'BillType');
    tt.chargeIds = readListOfString(body, 'chargeId');
    tt.creditApplied = readInt(body, 'CreditApplied');
    tt.creditOverflow = readInt(body, 'CreditOverflow');
    tt.currency = readString(body, 'Currency');
    tt.notes = readString(body, 'Notes');
    tt.period = readInt(body, 'Period');
    tt.price = readInt(body, 'Price');
    tt.probiusId = readString(body, 'ProbiusId');
    tt.status = readString(body, 'Status');
    tt.wasAutopayUsed = readBool(body, 'WasAutopayUsed');
    tt.timeCreated = readInt(body, 'TimeCreated');

    tt.isLoaded = true;
    return tt;
  }

  static copier(Bill dest, Bill alt) {
    dest.loadFromAltBill(alt);
  }

  void loadFromAltBill(Bill alt) {
    billId = alt.billId;
    billType = alt.billType;
    chargeIds = alt.chargeIds;
    creditApplied = alt.creditApplied;
    creditOverflow = alt.creditOverflow;
    currency = alt.currency;
    notes = alt.notes;
    period = alt.period;
    price = alt.price;
    probiusId = alt.probiusId;
    status = alt.status;
    wasAutopayUsed = alt.wasAutopayUsed;
    timeCreated = alt.timeCreated;

    isLoaded = true;
  }

  @computed
  bool get needsPayment {
    if (status == 'created' || status == 'try_again') {
      return true;
    }
    return false;
  }
}
