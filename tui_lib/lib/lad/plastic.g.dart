// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plastic.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Plastic on PlasticBase, Store {
  late final _$plasticIdAtom =
      Atom(name: 'PlasticBase.plasticId', context: context);

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

  late final _$brandAtom = Atom(name: 'PlasticBase.brand', context: context);

  @override
  String get brand {
    _$brandAtom.reportRead();
    return super.brand;
  }

  @override
  set brand(String value) {
    if (super.brand != value) {
      _$brandAtom.reportWrite(value, super.brand, () {
        super.brand = value;
      });
    }
  }

  late final _$countryAtom =
      Atom(name: 'PlasticBase.country', context: context);

  @override
  String get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String value) {
    if (super.country != value) {
      _$countryAtom.reportWrite(value, super.country, () {
        super.country = value;
      });
    }
  }

  late final _$expMonthAtom =
      Atom(name: 'PlasticBase.expMonth', context: context);

  @override
  int get expMonth {
    _$expMonthAtom.reportRead();
    return super.expMonth;
  }

  @override
  set expMonth(int value) {
    if (super.expMonth != value) {
      _$expMonthAtom.reportWrite(value, super.expMonth, () {
        super.expMonth = value;
      });
    }
  }

  late final _$expYearAtom =
      Atom(name: 'PlasticBase.expYear', context: context);

  @override
  int get expYear {
    _$expYearAtom.reportRead();
    return super.expYear;
  }

  @override
  set expYear(int value) {
    if (super.expYear != value) {
      _$expYearAtom.reportWrite(value, super.expYear, () {
        super.expYear = value;
      });
    }
  }

  late final _$isDefaultAtom =
      Atom(name: 'PlasticBase.isDefault', context: context);

  @override
  bool get isDefault {
    _$isDefaultAtom.reportRead();
    return super.isDefault;
  }

  @override
  set isDefault(bool value) {
    if (super.isDefault != value) {
      _$isDefaultAtom.reportWrite(value, super.isDefault, () {
        super.isDefault = value;
      });
    }
  }

  late final _$last4Atom = Atom(name: 'PlasticBase.last4', context: context);

  @override
  String get last4 {
    _$last4Atom.reportRead();
    return super.last4;
  }

  @override
  set last4(String value) {
    if (super.last4 != value) {
      _$last4Atom.reportWrite(value, super.last4, () {
        super.last4 = value;
      });
    }
  }

  @override
  String toString() {
    return '''
plasticId: ${plasticId},
brand: ${brand},
country: ${country},
expMonth: ${expMonth},
expYear: ${expYear},
isDefault: ${isDefault},
last4: ${last4}
    ''';
  }
}
