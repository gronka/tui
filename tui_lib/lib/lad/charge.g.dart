// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Charge on ChargeBase, Store {
  Computed<String>? _$titleComputed;

  @override
  String get title => (_$titleComputed ??=
          Computed<String>(() => super.title, name: 'ChargeBase.title'))
      .value;
  Computed<bool>? _$isDocumentChargeComputed;

  @override
  bool get isDocumentCharge => (_$isDocumentChargeComputed ??= Computed<bool>(
          () => super.isDocumentCharge,
          name: 'ChargeBase.isDocumentCharge'))
      .value;

  late final _$chargeIdAtom =
      Atom(name: 'ChargeBase.chargeId', context: context);

  @override
  String get chargeId {
    _$chargeIdAtom.reportRead();
    return super.chargeId;
  }

  @override
  set chargeId(String value) {
    if (super.chargeId != value) {
      _$chargeIdAtom.reportWrite(value, super.chargeId, () {
        super.chargeId = value;
      });
    }
  }

  late final _$probiusIdAtom =
      Atom(name: 'ChargeBase.probiusId', context: context);

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

  late final _$chargeTypeAtom =
      Atom(name: 'ChargeBase.chargeType', context: context);

  @override
  ChargeType get chargeType {
    _$chargeTypeAtom.reportRead();
    return super.chargeType;
  }

  @override
  set chargeType(ChargeType value) {
    if (super.chargeType != value) {
      _$chargeTypeAtom.reportWrite(value, super.chargeType, () {
        super.chargeType = value;
      });
    }
  }

  late final _$currencyAtom =
      Atom(name: 'ChargeBase.currency', context: context);

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

  late final _$descriptionAtom =
      Atom(name: 'ChargeBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    if (super.description != value) {
      _$descriptionAtom.reportWrite(value, super.description, () {
        super.description = value;
      });
    }
  }

  late final _$metaAtom = Atom(name: 'ChargeBase.meta', context: context);

  @override
  String get meta {
    _$metaAtom.reportRead();
    return super.meta;
  }

  @override
  set meta(String value) {
    if (super.meta != value) {
      _$metaAtom.reportWrite(value, super.meta, () {
        super.meta = value;
      });
    }
  }

  late final _$periodAtom = Atom(name: 'ChargeBase.period', context: context);

  @override
  int get period {
    _$periodAtom.reportRead();
    return super.period;
  }

  @override
  set period(int value) {
    if (super.period != value) {
      _$periodAtom.reportWrite(value, super.period, () {
        super.period = value;
      });
    }
  }

  late final _$planIdAtom = Atom(name: 'ChargeBase.planId', context: context);

  @override
  int get planId {
    _$planIdAtom.reportRead();
    return super.planId;
  }

  @override
  set planId(int value) {
    if (super.planId != value) {
      _$planIdAtom.reportWrite(value, super.planId, () {
        super.planId = value;
      });
    }
  }

  late final _$priceAtom = Atom(name: 'ChargeBase.price', context: context);

  @override
  int get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(int value) {
    if (super.price != value) {
      _$priceAtom.reportWrite(value, super.price, () {
        super.price = value;
      });
    }
  }

  late final _$timeCreatedAtom =
      Atom(name: 'ChargeBase.timeCreated', context: context);

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

  late final _$unitsAtom = Atom(name: 'ChargeBase.units', context: context);

  @override
  int get units {
    _$unitsAtom.reportRead();
    return super.units;
  }

  @override
  set units(int value) {
    if (super.units != value) {
      _$unitsAtom.reportWrite(value, super.units, () {
        super.units = value;
      });
    }
  }

  @override
  String toString() {
    return '''
chargeId: ${chargeId},
probiusId: ${probiusId},
chargeType: ${chargeType},
currency: ${currency},
description: ${description},
meta: ${meta},
period: ${period},
planId: ${planId},
price: ${price},
timeCreated: ${timeCreated},
units: ${units},
title: ${title},
isDocumentCharge: ${isDocumentCharge}
    ''';
  }
}
