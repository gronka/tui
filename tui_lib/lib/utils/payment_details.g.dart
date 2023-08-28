// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentDetails on PaymentDetailsBase, Store {
  Computed<bool>? _$isPlasticIdEmptyComputed;

  @override
  bool get isPlasticIdEmpty => (_$isPlasticIdEmptyComputed ??= Computed<bool>(
          () => super.isPlasticIdEmpty,
          name: 'PaymentDetailsBase.isPlasticIdEmpty'))
      .value;
  Computed<bool>? _$isPlasticIdNotEmptyNorUnlistedComputed;

  @override
  bool get isPlasticIdNotEmptyNorUnlisted =>
      (_$isPlasticIdNotEmptyNorUnlistedComputed ??= Computed<bool>(
              () => super.isPlasticIdNotEmptyNorUnlisted,
              name: 'PaymentDetailsBase.isPlasticIdNotEmptyNorUnlisted'))
          .value;
  Computed<bool>? _$isPlasticIdUnlistedComputed;

  @override
  bool get isPlasticIdUnlisted => (_$isPlasticIdUnlistedComputed ??=
          Computed<bool>(() => super.isPlasticIdUnlisted,
              name: 'PaymentDetailsBase.isPlasticIdUnlisted'))
      .value;
  Computed<bool>? _$isBtcpayComputed;

  @override
  bool get isBtcpay =>
      (_$isBtcpayComputed ??= Computed<bool>(() => super.isBtcpay,
              name: 'PaymentDetailsBase.isBtcpay'))
          .value;
  Computed<bool>? _$isStripeComputed;

  @override
  bool get isStripe =>
      (_$isStripeComputed ??= Computed<bool>(() => super.isStripe,
              name: 'PaymentDetailsBase.isStripe'))
          .value;
  Computed<bool>? _$isReadyForCheckoutComputed;

  @override
  bool get isReadyForCheckout => (_$isReadyForCheckoutComputed ??=
          Computed<bool>(() => super.isReadyForCheckout,
              name: 'PaymentDetailsBase.isReadyForCheckout'))
      .value;
  Computed<bool>? _$isTotalPriceZeroComputed;

  @override
  bool get isTotalPriceZero => (_$isTotalPriceZeroComputed ??= Computed<bool>(
          () => super.isTotalPriceZero,
          name: 'PaymentDetailsBase.isTotalPriceZero'))
      .value;
  Computed<int>? _$creditMaxComputed;

  @override
  int get creditMax =>
      (_$creditMaxComputed ??= Computed<int>(() => super.creditMax,
              name: 'PaymentDetailsBase.creditMax'))
          .value;
  Computed<int>? _$creditAfterTransactionComputed;

  @override
  int get creditAfterTransaction => (_$creditAfterTransactionComputed ??=
          Computed<int>(() => super.creditAfterTransaction,
              name: 'PaymentDetailsBase.creditAfterTransaction'))
      .value;
  Computed<int>? _$totalPriceComputed;

  @override
  int get totalPrice =>
      (_$totalPriceComputed ??= Computed<int>(() => super.totalPrice,
              name: 'PaymentDetailsBase.totalPrice'))
          .value;
  Computed<int>? _$totalPriceAfterCreditComputed;

  @override
  int get totalPriceAfterCredit => (_$totalPriceAfterCreditComputed ??=
          Computed<int>(() => super.totalPriceAfterCredit,
              name: 'PaymentDetailsBase.totalPriceAfterCredit'))
      .value;
  Computed<String>? _$basketAsStringComputed;

  @override
  String get basketAsString =>
      (_$basketAsStringComputed ??= Computed<String>(() => super.basketAsString,
              name: 'PaymentDetailsBase.basketAsString'))
          .value;

  late final _$billIdAtom =
      Atom(name: 'PaymentDetailsBase.billId', context: context);

  @override
  String get billId {
    _$billIdAtom.reportRead();
    return super.billId;
  }

  @override
  set billId(String value) {
    if (super.billId != value) {
      _$billIdAtom.reportWrite(value, super.billId, () {
        super.billId = value;
      });
    }
  }

  late final _$planIdAtom =
      Atom(name: 'PaymentDetailsBase.planId', context: context);

  @override
  String get planId {
    _$planIdAtom.reportRead();
    return super.planId;
  }

  @override
  set planId(String value) {
    if (super.planId != value) {
      _$planIdAtom.reportWrite(value, super.planId, () {
        super.planId = value;
      });
    }
  }

  late final _$plasticIdAtom =
      Atom(name: 'PaymentDetailsBase.plasticId', context: context);

  @override
  String get plasticId {
    _$plasticIdAtom.reportRead();
    return super.plasticId;
  }

  @override
  set plasticId(String value) {
    if (super.plasticId != value) {
      _$plasticIdAtom.reportWrite(value, super.plasticId, () {
        super.plasticId = value;
      });
    }
  }

  late final _$probiusIdAtom =
      Atom(name: 'PaymentDetailsBase.probiusId', context: context);

  @override
  String get probiusId {
    _$probiusIdAtom.reportRead();
    return super.probiusId;
  }

  @override
  set probiusId(String value) {
    if (super.probiusId != value) {
      _$probiusIdAtom.reportWrite(value, super.probiusId, () {
        super.probiusId = value;
      });
    }
  }

  late final _$projectIdAtom =
      Atom(name: 'PaymentDetailsBase.projectId', context: context);

  @override
  String get projectId {
    _$projectIdAtom.reportRead();
    return super.projectId;
  }

  @override
  set projectId(String value) {
    if (super.projectId != value) {
      _$projectIdAtom.reportWrite(value, super.projectId, () {
        super.projectId = value;
      });
    }
  }

  late final _$coinAtom =
      Atom(name: 'PaymentDetailsBase.coin', context: context);

  @override
  Coin? get coin {
    _$coinAtom.reportRead();
    return super.coin;
  }

  @override
  set coin(Coin? value) {
    if (super.coin != value) {
      _$coinAtom.reportWrite(value, super.coin, () {
        super.coin = value;
      });
    }
  }

  late final _$applyCreditAtom =
      Atom(name: 'PaymentDetailsBase.applyCredit', context: context);

  @override
  int get applyCredit {
    _$applyCreditAtom.reportRead();
    return super.applyCredit;
  }

  @override
  set applyCredit(int value) {
    if (super.applyCredit != value) {
      _$applyCreditAtom.reportWrite(value, super.applyCredit, () {
        super.applyCredit = value;
      });
    }
  }

  late final _$isAgreementAcceptedAtom =
      Atom(name: 'PaymentDetailsBase.isAgreementAccepted', context: context);

  @override
  bool get isAgreementAccepted {
    _$isAgreementAcceptedAtom.reportRead();
    return super.isAgreementAccepted;
  }

  @override
  set isAgreementAccepted(bool value) {
    if (super.isAgreementAccepted != value) {
      _$isAgreementAcceptedAtom.reportWrite(value, super.isAgreementAccepted,
          () {
        super.isAgreementAccepted = value;
      });
    }
  }

  late final _$isAutopaySelectedAtom =
      Atom(name: 'PaymentDetailsBase.isAutopaySelected', context: context);

  @override
  bool get isAutopaySelected {
    _$isAutopaySelectedAtom.reportRead();
    return super.isAutopaySelected;
  }

  @override
  set isAutopaySelected(bool value) {
    if (super.isAutopaySelected != value) {
      _$isAutopaySelectedAtom.reportWrite(value, super.isAutopaySelected, () {
        super.isAutopaySelected = value;
      });
    }
  }

  late final _$isSaveCardSelectedAtom =
      Atom(name: 'PaymentDetailsBase.isSaveCardSelected', context: context);

  @override
  bool get isSaveCardSelected {
    _$isSaveCardSelectedAtom.reportRead();
    return super.isSaveCardSelected;
  }

  @override
  set isSaveCardSelected(bool value) {
    if (super.isSaveCardSelected != value) {
      _$isSaveCardSelectedAtom.reportWrite(value, super.isSaveCardSelected, () {
        super.isSaveCardSelected = value;
      });
    }
  }

  late final _$overrideTotalAtom =
      Atom(name: 'PaymentDetailsBase.overrideTotal', context: context);

  @override
  int get overrideTotal {
    _$overrideTotalAtom.reportRead();
    return super.overrideTotal;
  }

  @override
  set overrideTotal(int value) {
    if (super.overrideTotal != value) {
      _$overrideTotalAtom.reportWrite(value, super.overrideTotal, () {
        super.overrideTotal = value;
      });
    }
  }

  late final _$platformAtom =
      Atom(name: 'PaymentDetailsBase.platform', context: context);

  @override
  PaymentPlatform get platform {
    _$platformAtom.reportRead();
    return super.platform;
  }

  @override
  set platform(PaymentPlatform value) {
    if (super.platform != value) {
      _$platformAtom.reportWrite(value, super.platform, () {
        super.platform = value;
      });
    }
  }

  late final _$siloAtom =
      Atom(name: 'PaymentDetailsBase.silo', context: context);

  @override
  PaymentSilo get silo {
    _$siloAtom.reportRead();
    return super.silo;
  }

  @override
  set silo(PaymentSilo value) {
    if (super.silo != value) {
      _$siloAtom.reportWrite(value, super.silo, () {
        super.silo = value;
      });
    }
  }

  late final _$termsAcceptedVersionAtom =
      Atom(name: 'PaymentDetailsBase.termsAcceptedVersion', context: context);

  @override
  String get termsAcceptedVersion {
    _$termsAcceptedVersionAtom.reportRead();
    return super.termsAcceptedVersion;
  }

  @override
  set termsAcceptedVersion(String value) {
    if (super.termsAcceptedVersion != value) {
      _$termsAcceptedVersionAtom.reportWrite(value, super.termsAcceptedVersion,
          () {
        super.termsAcceptedVersion = value;
      });
    }
  }

  late final _$PaymentDetailsBaseActionController =
      ActionController(name: 'PaymentDetailsBase', context: context);

  @override
  void setPlasticId(String? id) {
    final _$actionInfo = _$PaymentDetailsBaseActionController.startAction(
        name: 'PaymentDetailsBase.setPlasticId');
    try {
      return super.setPlasticId(id);
    } finally {
      _$PaymentDetailsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOverrideTotalWithDouble(double priceAsDouble) {
    final _$actionInfo = _$PaymentDetailsBaseActionController.startAction(
        name: 'PaymentDetailsBase.setOverrideTotalWithDouble');
    try {
      return super.setOverrideTotalWithDouble(priceAsDouble);
    } finally {
      _$PaymentDetailsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emptyBasketAndAddItem(BasketItem item) {
    final _$actionInfo = _$PaymentDetailsBaseActionController.startAction(
        name: 'PaymentDetailsBase.emptyBasketAndAddItem');
    try {
      return super.emptyBasketAndAddItem(item);
    } finally {
      _$PaymentDetailsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToBasket(BasketItem item) {
    final _$actionInfo = _$PaymentDetailsBaseActionController.startAction(
        name: 'PaymentDetailsBase.addToBasket');
    try {
      return super.addToBasket(item);
    } finally {
      _$PaymentDetailsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
billId: ${billId},
planId: ${planId},
plasticId: ${plasticId},
probiusId: ${probiusId},
projectId: ${projectId},
coin: ${coin},
applyCredit: ${applyCredit},
isAgreementAccepted: ${isAgreementAccepted},
isAutopaySelected: ${isAutopaySelected},
isSaveCardSelected: ${isSaveCardSelected},
overrideTotal: ${overrideTotal},
platform: ${platform},
silo: ${silo},
termsAcceptedVersion: ${termsAcceptedVersion},
isPlasticIdEmpty: ${isPlasticIdEmpty},
isPlasticIdNotEmptyNorUnlisted: ${isPlasticIdNotEmptyNorUnlisted},
isPlasticIdUnlisted: ${isPlasticIdUnlisted},
isBtcpay: ${isBtcpay},
isStripe: ${isStripe},
isReadyForCheckout: ${isReadyForCheckout},
isTotalPriceZero: ${isTotalPriceZero},
creditMax: ${creditMax},
creditAfterTransaction: ${creditAfterTransaction},
totalPrice: ${totalPrice},
totalPriceAfterCredit: ${totalPriceAfterCredit},
basketAsString: ${basketAsString}
    ''';
  }
}
