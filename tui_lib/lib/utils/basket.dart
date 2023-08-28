import 'package:mobx/mobx.dart';

part 'basket.g.dart';

enum BasketItemType {
  none,
  plan,
  overage,
  singlePayment,
  addCredit,
  billPay,
}

extension BasketItemTypeValueExtension on BasketItemType {
  String get asString {
    switch (this) {
      case BasketItemType.none:
        return 'none';
      case BasketItemType.plan:
        return 'plan';
      case BasketItemType.overage:
        return 'overage';
      case BasketItemType.singlePayment:
        return 'single_payment';
      case BasketItemType.addCredit:
        return 'add_credit';
      case BasketItemType.billPay:
        return 'bill_pay';
    }
  }
}

class BasketItem = BasketItemBase with _$BasketItem;

abstract class BasketItemBase with Store {
  @observable
  String adminNotes = '';
  @observable
  String itemId = '';
  @observable
  BasketItemType itemType = BasketItemType.none;
  @observable
  String name = '';
  @observable
  int price = 0;

  @action
  setPriceWithDouble(double priceAsDouble) {
    price = (priceAsDouble * 100).toInt();
  }

  @computed
  Map<String, dynamic> get asJson {
    return {
      'AdminNotes': adminNotes,
      'ItemId': itemId,
      'ItemType': itemType.asString,
      'Name': name,
      'Price': price,
    };
  }
}
