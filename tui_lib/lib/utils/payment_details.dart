import 'dart:convert';
import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'payment_details.g.dart';

enum PaymentPlatform { btcpay, stripe }

enum Coin { doge, ltc, xrp }

extension ParseToString on Coin {
  String get title {
    var name = this.toString().split('.').last;
    switch (name) {
      case 'btc':
        return 'BTC (BitCoin)';
      case 'doge':
        return 'DOGE (DogeCoin)';
      case 'ltc':
        return 'LTC (LiteCoin)';
      case 'xlm':
        return 'XLM (Stellar)';
      case 'xrp':
        return 'XRP (Ripple)';
      default:
        return 'error - please notify us if you see this';
    }
  }
}

class PaymentDetails = PaymentDetailsBase with _$PaymentDetails;

abstract class PaymentDetailsBase with Store {
  @observable
  String billId = '';
  @observable
  String planId = '';
  @observable
  String plasticId = '';
  @observable
  String probiusId = '';
  @observable
  String projectId = '';

  @observable
  Coin? coin;
  // NOTE: applyCredit can be probius.credit or another credit amount
  @observable
  int applyCredit = 0;
  @observable
  bool isAgreementAccepted = false;
  @observable
  bool isAutopaySelected = true;
  @observable
  bool isSaveCardSelected = true;
  @observable
  int overrideTotal = 0;
  @observable
  PaymentPlatform platform = PaymentPlatform.stripe;
  @observable
  PaymentSilo silo = PaymentSilo.none;
  @observable
  String termsAcceptedVersion = '';

  final ObservableList<BasketItem> basketItems = ObservableList();

  @action
  void setPlasticId(String? id) {
    plasticId = id ?? '';
  }

  @computed
  bool get isPlasticIdEmpty {
    return plasticId.isEmpty;
  }

  @computed
  bool get isPlasticIdNotEmptyNorUnlisted {
    return plasticId.isNotEmpty && plasticId != 'unlisted';
  }

  @computed
  bool get isPlasticIdUnlisted {
    return plasticId == 'unlisted';
  }

  @computed
  bool get isBtcpay {
    return platform == PaymentPlatform.btcpay;
  }

  @computed
  bool get isStripe {
    return platform == PaymentPlatform.stripe;
  }

  @computed
  bool get isReadyForCheckout {
    if (!isAgreementAccepted) {
      return false;
    }

    if (silo == PaymentSilo.addCredit && isTotalPriceZero) {
      return false;
    }

    switch (platform) {
      case PaymentPlatform.btcpay:
        return coin != null;
      case PaymentPlatform.stripe:
        return plasticId.isNotEmpty;
    }
  }

  @computed
  bool get isTotalPriceZero {
    return totalPriceAfterCredit == 0;
  }

  @computed
  int get creditMax {
    if (totalPrice > applyCredit) {
      return applyCredit;
    } else {
      return totalPrice;
    }
  }

  @computed
  int get creditAfterTransaction {
    var credit = applyCredit - totalPrice;
    if (credit <= 0) {
      return 0;
    } else {
      return applyCredit;
    }
  }

  @computed
  int get totalPrice {
    if (silo == PaymentSilo.basket) {
      int total = 0;
      for (final item in basketItems) {
        total += item.price;
      }
      return total;
    } else {
      return overrideTotal;
    }
  }

  @computed
  int get totalPriceAfterCredit {
    return totalPrice - creditMax;
  }

  @action
  setOverrideTotalWithDouble(double priceAsDouble) {
    overrideTotal = (priceAsDouble * 100).toInt();
  }

  @action
  void emptyBasketAndAddItem(BasketItem item) {
    basketItems.clear();
    basketItems.add(item);
  }

  @action
  void addToBasket(BasketItem item) {
    basketItems.add(item);
  }

  @computed
  String get basketAsString {
    List<Map<String, dynamic>> basketTemp = [];
    for (final item in basketItems) {
      basketTemp.add(item.asJson);
    }
    return jsonEncode(basketTemp);
  }

  Map<String, dynamic> asStripePayload(King king) {
    if (silo == PaymentSilo.none) {
      throw Exception('Cannot submit silo of none type');
    }

    return {
      'BillId': billId,
      'PlanId': planId,
      'PlasticId': plasticId,
      'ProbiusId': probiusId,
      'ProjectId': projectId,
      'CreditApplied': creditMax,
      'IsAutopaySelected': isAutopaySelected,
      'IsSaveCardSelected': isSaveCardSelected,
      'IsPlasticIdUnlisted': isPlasticIdUnlisted,
      'Silo': silo.papi,
      'TermsAcceptedVersion': isAgreementAccepted ? '2.0' : '',
      'TotalPrice': totalPrice,
      'TotalPriceAfterCredit': totalPriceAfterCredit,
      'BasketString': basketAsString,
      'Basket': basketItems.map((x) => x.asJson).toList(),
    };
  }
}
