import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'charge.g.dart';

enum ChargeType { none, plan, challenge, comparables }

extension FotTitleExtension on ChargeType {
  String get forTitle {
    switch (this) {
      case ChargeType.none:
        return 'None';
      case ChargeType.plan:
        return 'Plan Change';
      case ChargeType.challenge:
        return 'Real Estate Challenge';
      case ChargeType.comparables:
        return 'Real Estate Comparables';
    }
  }
}

class ChargeProxy {
  ChargeProxy({
    required this.chargeCache,
    required this.king,
  });
  final Cache<Charge> chargeCache;
  final King king;

  Charge getById(
    String chargeId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      chargeCache.apiGetById(
          url: EndpointsV2.chargeGetById,
          idName: 'ChargeId',
          id: chargeId,
          forceApi: forceApi);
    }

    return chargeCache.getItem(chargeId);
  }

  static ChargeProxy of(BuildContext context) {
    return King.of(context).lad.chargeProxy;
  }
}

class Charge = ChargeBase with _$Charge;

abstract class ChargeBase with Store {
  @observable
  String chargeId = '';
  @observable
  String probiusId = '';
  @observable
  ChargeType chargeType = ChargeType.none;
  @observable
  String currency = '';
  @observable
  String description = '';
  @observable
  String meta = '';
  @observable
  int period = 0;
  @observable
  int planId = 0;
  @observable
  int price = 0;
  @observable
  int timeCreated = 0;
  @observable
  int units = 0;

  bool isLoaded = false;

  static Charge unpackById(Map<String, dynamic> body, Charge tt) {
    tt.chargeId = readString(body, 'ChargeId');
    tt.probiusId = readString(body, 'ProbiusId');
    tt.currency = readString(body, 'Currency');
    // for some reason charge_type fails to decode as an int
    tt.chargeType = _stringToChargeType(readString(body, 'ChargeType'));
    tt.description = readString(body, 'Description');
    tt.meta = readString(body, 'Meta');
    tt.period = readInt(body, 'Period');
    tt.planId = readInt(body, 'PlanId');
    tt.price = readInt(body, 'Price');
    tt.timeCreated = readInt(body, 'Time_Created');
    tt.units = readInt(body, 'Units');

    tt.isLoaded = true;
    return tt;
  }

  static copier(Charge dest, Charge alt) {
    dest.loadFromAltCharge(alt);
  }

  void loadFromAltCharge(Charge alt) {
    chargeId = alt.chargeId;
    description = alt.description;
    meta = alt.meta;
    currency = alt.currency;
    period = alt.period;
    planId = alt.planId;
    price = alt.price;
    probiusId = alt.probiusId;
    timeCreated = alt.timeCreated;
    units = alt.units;

    chargeType = alt.chargeType;

    isLoaded = true;
  }

  @computed
  String get title {
    return 'Charged at ${stampToDateAndTime(timeCreated)} for ${chargeType.forTitle}';
  }

  @computed
  bool get isDocumentCharge {
    switch (chargeType) {
      case ChargeType.none:
      case ChargeType.plan:
        return false;

      case ChargeType.challenge:
      case ChargeType.comparables:
        return true;
    }
  }
}

ChargeType _stringToChargeType(String jin) {
  switch (jin) {
    case '1':
      return ChargeType.plan;
    case '2':
      return ChargeType.challenge;
    case '3':
      return ChargeType.comparables;
    case '4':
    default:
      return ChargeType.none;
  }
}
