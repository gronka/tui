import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'payment.g.dart';

enum PaymentSilo {
  none,
  addCredit,
  basket,
  billPay,
  plan,
}

enum PaymentStatus {
  none,
  created,
  failed,
  waitingOnStripe,
  waitingToProcess,
  processing,
  processed,
}

enum PaymentAttemptType {
  ccAttempt,
  cryptoAttempt,
  successful,
}

extension PaymentSiloExtensions on PaymentSilo {
  String get human {
    switch (this) {
      case PaymentSilo.none:
        return 'none';
      case PaymentSilo.addCredit:
        return 'credit';
      case PaymentSilo.basket:
        return 'basket';
      case PaymentSilo.billPay:
        return 'monthly bill';
      case PaymentSilo.plan:
        return 'plan';
    }
  }

  String get papi {
    switch (this) {
      case PaymentSilo.none:
        return 'none';
      case PaymentSilo.addCredit:
        return 'add_credit';
      case PaymentSilo.basket:
        return 'basket';
      case PaymentSilo.billPay:
        return 'bill_pay';
      case PaymentSilo.plan:
        return 'plan';
    }
  }
}

extension PaymentStatusExtensions on PaymentStatus {
  String get human {
    switch (this) {
      case PaymentStatus.none:
        return 'none';
      case PaymentStatus.created:
        return 'created';
      case PaymentStatus.failed:
        return 'failed';
      case PaymentStatus.waitingOnStripe:
        return 'waiting on Stripe';
      case PaymentStatus.waitingToProcess:
        return 'waiting to process (should be fast)';
      case PaymentStatus.processing:
        return 'processing (should be fast)';
      case PaymentStatus.processed:
        return 'success';
    }
  }
}

class PaymentProxy {
  PaymentProxy({
    required this.paymentCache,
    required this.king,
  });
  final Cache<Payment> paymentCache;
  final King king;

  Payment getById(
    String paymentId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      paymentCache.apiGetById(
          url: EndpointsV2.paymentGetById,
          idName: 'PaymentId',
          id: paymentId,
          forceApi: forceApi);
    }

    return paymentCache.getItem(paymentId);
  }

  static PaymentProxy of(BuildContext context) {
    return King.of(context).lad.paymentProxy;
  }
}

class Payment = PaymentBase with _$Payment;

abstract class PaymentBase with Store {
  @observable
  String paymentId = '';
  @observable
  String billId = '';
  @observable
  String probiusId = '';
  @observable
  String adminNotes = '';
  @observable
  String basket = '';
  @observable
  int creditApplied = 0;
  @observable
  String currency = '';
  @observable
  bool isAutopaySelected = false;
  @observable
  String plasticId = '';
  @observable
  PaymentSilo silo = PaymentSilo.none;
  @observable
  PaymentStatus status = PaymentStatus.none;
  @observable
  int totalPrice = 0;
  @observable
  int totalPriceAfterCredit = 0;
  @observable
  int timeCreated = 0;

  bool isLoaded = false;

  static Payment unpackById(Map<String, dynamic> body, Payment tt) {
    tt.billId = readString(body, 'BillId');
    tt.paymentId = readString(body, 'PaymentId');
    tt.probiusId = readString(body, 'ProbiusId');
    tt.adminNotes = readString(body, 'AdminNotes');
    tt.basket = readString(body, 'Basket');
    tt.creditApplied = readInt(body, 'CreditApplied');
    tt.currency = readString(body, 'Currency');
    tt.isAutopaySelected = readBool(body, 'IsAutopaySelected');
    tt.plasticId = readString(body, 'PlasticId');
    tt.totalPrice = readInt(body, 'total_price');
    tt.totalPriceAfterCredit = readInt(body, 'total_price_after_credit');
    tt.timeCreated = readInt(body, 'time_created');

    tt.silo = _stringToPaymentSilo(readString(body, 'silo'));
    tt.status = _stringToPaymentStatus(readString(body, 'status'));

    tt.isLoaded = true;
    return tt;
  }

  static copier(Payment dest, Payment alt) {
    dest.loadFromAltPayment(alt);
  }

  void loadFromAltPayment(Payment alt) {
    billId = alt.billId;
    paymentId = alt.paymentId;
    probiusId = alt.probiusId;
    adminNotes = alt.adminNotes;
    basket = alt.basket;
    creditApplied = alt.creditApplied;
    currency = alt.currency;
    isAutopaySelected = alt.isAutopaySelected;
    plasticId = alt.plasticId;
    totalPrice = alt.totalPrice;
    totalPriceAfterCredit = alt.totalPriceAfterCredit;
    timeCreated = alt.timeCreated;

    silo = alt.silo;
    status = alt.status;

    isLoaded = true;
  }
}

PaymentSilo _stringToPaymentSilo(String jin) {
  switch (jin) {
    case 'add_credit':
      return PaymentSilo.addCredit;
    case 'bill_pay':
      return PaymentSilo.billPay;
    case 'plan':
      return PaymentSilo.plan;
    default:
      return PaymentSilo.none;
  }
}

PaymentStatus _stringToPaymentStatus(String jin) {
  switch (jin) {
    case '5':
      return PaymentStatus.created;
    case '10':
      return PaymentStatus.failed;
    case '30':
      return PaymentStatus.waitingOnStripe;
    case '50':
      return PaymentStatus.waitingToProcess;
    case '60':
      return PaymentStatus.processing;
    case '70':
      return PaymentStatus.processed;
    default:
      return PaymentStatus.none;
  }
}
