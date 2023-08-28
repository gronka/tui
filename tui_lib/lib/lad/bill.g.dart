// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Bill on BillBase, Store {
  Computed<bool>? _$needsPaymentComputed;

  @override
  bool get needsPayment =>
      (_$needsPaymentComputed ??= Computed<bool>(() => super.needsPayment,
              name: 'BillBase.needsPayment'))
          .value;

  late final _$billIdAtom = Atom(name: 'BillBase.billId', context: context);

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

  late final _$billTypeAtom = Atom(name: 'BillBase.billType', context: context);

  @override
  String get billType {
    _$billTypeAtom.reportRead();
    return super.billType;
  }

  @override
  set billType(String value) {
    if (super.billType != value) {
      _$billTypeAtom.reportWrite(value, super.billType, () {
        super.billType = value;
      });
    }
  }

  late final _$chargeIdsAtom =
      Atom(name: 'BillBase.chargeIds', context: context);

  @override
  List<String> get chargeIds {
    _$chargeIdsAtom.reportRead();
    return super.chargeIds;
  }

  @override
  set chargeIds(List<String> value) {
    if (super.chargeIds != value) {
      _$chargeIdsAtom.reportWrite(value, super.chargeIds, () {
        super.chargeIds = value;
      });
    }
  }

  late final _$creditAppliedAtom =
      Atom(name: 'BillBase.creditApplied', context: context);

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

  late final _$creditOverflowAtom =
      Atom(name: 'BillBase.creditOverflow', context: context);

  @override
  int get creditOverflow {
    _$creditOverflowAtom.reportRead();
    return super.creditOverflow;
  }

  @override
  set creditOverflow(int value) {
    if (super.creditOverflow != value) {
      _$creditOverflowAtom.reportWrite(value, super.creditOverflow, () {
        super.creditOverflow = value;
      });
    }
  }

  late final _$currencyAtom = Atom(name: 'BillBase.currency', context: context);

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

  late final _$notesAtom = Atom(name: 'BillBase.notes', context: context);

  @override
  String get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(String value) {
    if (super.notes != value) {
      _$notesAtom.reportWrite(value, super.notes, () {
        super.notes = value;
      });
    }
  }

  late final _$periodAtom = Atom(name: 'BillBase.period', context: context);

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

  late final _$priceAtom = Atom(name: 'BillBase.price', context: context);

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

  late final _$probiusIdAtom =
      Atom(name: 'BillBase.probiusId', context: context);

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

  late final _$statusAtom = Atom(name: 'BillBase.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    if (super.status != value) {
      _$statusAtom.reportWrite(value, super.status, () {
        super.status = value;
      });
    }
  }

  late final _$timeCreatedAtom =
      Atom(name: 'BillBase.timeCreated', context: context);

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

  late final _$wasAutopayUsedAtom =
      Atom(name: 'BillBase.wasAutopayUsed', context: context);

  @override
  bool get wasAutopayUsed {
    _$wasAutopayUsedAtom.reportRead();
    return super.wasAutopayUsed;
  }

  @override
  set wasAutopayUsed(bool value) {
    if (super.wasAutopayUsed != value) {
      _$wasAutopayUsedAtom.reportWrite(value, super.wasAutopayUsed, () {
        super.wasAutopayUsed = value;
      });
    }
  }

  @override
  String toString() {
    return '''
billId: ${billId},
billType: ${billType},
chargeIds: ${chargeIds},
creditApplied: ${creditApplied},
creditOverflow: ${creditOverflow},
currency: ${currency},
notes: ${notes},
period: ${period},
price: ${price},
probiusId: ${probiusId},
status: ${status},
timeCreated: ${timeCreated},
wasAutopayUsed: ${wasAutopayUsed},
needsPayment: ${needsPayment}
    ''';
  }
}
