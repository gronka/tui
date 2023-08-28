// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Payment on PaymentBase, Store {
  late final _$paymentIdAtom =
      Atom(name: 'PaymentBase.paymentId', context: context);

  @override
  String get paymentId {
    _$paymentIdAtom.reportRead();
    return super.paymentId;
  }

  @override
  set paymentId(String value) {
    if (super.paymentId != value) {
      _$paymentIdAtom.reportWrite(value, super.paymentId, () {
        super.paymentId = value;
      });
    }
  }

  late final _$billIdAtom = Atom(name: 'PaymentBase.billId', context: context);

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

  late final _$probiusIdAtom =
      Atom(name: 'PaymentBase.probiusId', context: context);

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

  late final _$adminNotesAtom =
      Atom(name: 'PaymentBase.adminNotes', context: context);

  @override
  String get adminNotes {
    _$adminNotesAtom.reportRead();
    return super.adminNotes;
  }

  @override
  set adminNotes(String value) {
    if (super.adminNotes != value) {
      _$adminNotesAtom.reportWrite(value, super.adminNotes, () {
        super.adminNotes = value;
      });
    }
  }

  late final _$basketAtom = Atom(name: 'PaymentBase.basket', context: context);

  @override
  String get basket {
    _$basketAtom.reportRead();
    return super.basket;
  }

  @override
  set basket(String value) {
    if (super.basket != value) {
      _$basketAtom.reportWrite(value, super.basket, () {
        super.basket = value;
      });
    }
  }

  late final _$creditAppliedAtom =
      Atom(name: 'PaymentBase.creditApplied', context: context);

  @override
  int get creditApplied {
    _$creditAppliedAtom.reportRead();
    return super.creditApplied;
  }

  @override
  set creditApplied(int value) {
    if (super.creditApplied != value) {
      _$creditAppliedAtom.reportWrite(value, super.creditApplied, () {
        super.creditApplied = value;
      });
    }
  }

  late final _$currencyAtom =
      Atom(name: 'PaymentBase.currency', context: context);

  @override
  String get currency {
    _$currencyAtom.reportRead();
    return super.currency;
  }

  @override
  set currency(String value) {
    if (super.currency != value) {
      _$currencyAtom.reportWrite(value, super.currency, () {
        super.currency = value;
      });
    }
  }

  late final _$isAutopaySelectedAtom =
      Atom(name: 'PaymentBase.isAutopaySelected', context: context);

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

  late final _$plasticIdAtom =
      Atom(name: 'PaymentBase.plasticId', context: context);

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

  late final _$siloAtom = Atom(name: 'PaymentBase.silo', context: context);

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

  late final _$statusAtom = Atom(name: 'PaymentBase.status', context: context);

  @override
  PaymentStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(PaymentStatus value) {
    if (super.status != value) {
      _$statusAtom.reportWrite(value, super.status, () {
        super.status = value;
      });
    }
  }

  late final _$totalPriceAtom =
      Atom(name: 'PaymentBase.totalPrice', context: context);

  @override
  int get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(int value) {
    if (super.totalPrice != value) {
      _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
        super.totalPrice = value;
      });
    }
  }

  late final _$totalPriceAfterCreditAtom =
      Atom(name: 'PaymentBase.totalPriceAfterCredit', context: context);

  @override
  int get totalPriceAfterCredit {
    _$totalPriceAfterCreditAtom.reportRead();
    return super.totalPriceAfterCredit;
  }

  @override
  set totalPriceAfterCredit(int value) {
    if (super.totalPriceAfterCredit != value) {
      _$totalPriceAfterCreditAtom
          .reportWrite(value, super.totalPriceAfterCredit, () {
        super.totalPriceAfterCredit = value;
      });
    }
  }

  late final _$timeCreatedAtom =
      Atom(name: 'PaymentBase.timeCreated', context: context);

  @override
  int get timeCreated {
    _$timeCreatedAtom.reportRead();
    return super.timeCreated;
  }

  @override
  set timeCreated(int value) {
    if (super.timeCreated != value) {
      _$timeCreatedAtom.reportWrite(value, super.timeCreated, () {
        super.timeCreated = value;
      });
    }
  }

  @override
  String toString() {
    return '''
paymentId: ${paymentId},
billId: ${billId},
probiusId: ${probiusId},
adminNotes: ${adminNotes},
basket: ${basket},
creditApplied: ${creditApplied},
currency: ${currency},
isAutopaySelected: ${isAutopaySelected},
plasticId: ${plasticId},
silo: ${silo},
status: ${status},
totalPrice: ${totalPrice},
totalPriceAfterCredit: ${totalPriceAfterCredit},
timeCreated: ${timeCreated}
    ''';
  }
}
