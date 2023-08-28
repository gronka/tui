// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'probius.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Probius on ProbiusBase, Store {
  Computed<String>? _$firstBillingPeriodAsStringComputed;

  @override
  String get firstBillingPeriodAsString =>
      (_$firstBillingPeriodAsStringComputed ??= Computed<String>(
              () => super.firstBillingPeriodAsString,
              name: 'ProbiusBase.firstBillingPeriodAsString'))
          .value;
  Computed<int>? _$firstBillingMonthComputed;

  @override
  int get firstBillingMonth => (_$firstBillingMonthComputed ??= Computed<int>(
          () => super.firstBillingMonth,
          name: 'ProbiusBase.firstBillingMonth'))
      .value;
  Computed<int>? _$firstBillingYearComputed;

  @override
  int get firstBillingYear => (_$firstBillingYearComputed ??= Computed<int>(
          () => super.firstBillingYear,
          name: 'ProbiusBase.firstBillingYear'))
      .value;
  Computed<String>? _$isAutopayEnabledStringComputed;

  @override
  String get isAutopayEnabledString => (_$isAutopayEnabledStringComputed ??=
          Computed<String>(() => super.isAutopayEnabledString,
              name: 'ProbiusBase.isAutopayEnabledString'))
      .value;
  Computed<int>? _$tokensRemainingComputed;

  @override
  int get tokensRemaining =>
      (_$tokensRemainingComputed ??= Computed<int>(() => super.tokensRemaining,
              name: 'ProbiusBase.tokensRemaining'))
          .value;

  late final _$probiusIdAtom =
      Atom(name: 'ProbiusBase.probiusId', context: context);

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

  late final _$creatorIdAtom =
      Atom(name: 'ProbiusBase.creatorId', context: context);

  @override
  String get creatorId {
    _$creatorIdAtom.reportRead();
    return super.creatorId;
  }

  @override
  set creatorId(String value) {
    if (super.creatorId != value) {
      _$creatorIdAtom.reportWrite(value, super.creatorId, () {
        super.creatorId = value;
      });
    }
  }

  late final _$defaultPlasticIdAtom =
      Atom(name: 'ProbiusBase.defaultPlasticId', context: context);

  @override
  String get defaultPlasticId {
    _$defaultPlasticIdAtom.reportRead();
    return super.defaultPlasticId;
  }

  @override
  set defaultPlasticId(String value) {
    if (super.defaultPlasticId != value) {
      _$defaultPlasticIdAtom.reportWrite(value, super.defaultPlasticId, () {
        super.defaultPlasticId = value;
      });
    }
  }

  late final _$projectIdAtom =
      Atom(name: 'ProbiusBase.projectId', context: context);

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

  late final _$stripeCustomerIdAtom =
      Atom(name: 'ProbiusBase.stripeCustomerId', context: context);

  @override
  String get stripeCustomerId {
    _$stripeCustomerIdAtom.reportRead();
    return super.stripeCustomerId;
  }

  @override
  set stripeCustomerId(String value) {
    if (super.stripeCustomerId != value) {
      _$stripeCustomerIdAtom.reportWrite(value, super.stripeCustomerId, () {
        super.stripeCustomerId = value;
      });
    }
  }

  late final _$creditAtom = Atom(name: 'ProbiusBase.credit', context: context);

  @override
  int get credit {
    _$creditAtom.reportRead();
    return super.credit;
  }

  @override
  set credit(int value) {
    if (super.credit != value) {
      _$creditAtom.reportWrite(value, super.credit, () {
        super.credit = value;
      });
    }
  }

  late final _$debtAtom = Atom(name: 'ProbiusBase.debt', context: context);

  @override
  int get debt {
    _$debtAtom.reportRead();
    return super.debt;
  }

  @override
  set debt(int value) {
    if (super.debt != value) {
      _$debtAtom.reportWrite(value, super.debt, () {
        super.debt = value;
      });
    }
  }

  late final _$firstPeriodAtom =
      Atom(name: 'ProbiusBase.firstPeriod', context: context);

  @override
  int get firstPeriod {
    _$firstPeriodAtom.reportRead();
    return super.firstPeriod;
  }

  @override
  set firstPeriod(int value) {
    if (super.firstPeriod != value) {
      _$firstPeriodAtom.reportWrite(value, super.firstPeriod, () {
        super.firstPeriod = value;
      });
    }
  }

  late final _$isAutopayEnabledAtom =
      Atom(name: 'ProbiusBase.isAutopayEnabled', context: context);

  @override
  bool get isAutopayEnabled {
    _$isAutopayEnabledAtom.reportRead();
    return super.isAutopayEnabled;
  }

  @override
  set isAutopayEnabled(bool value) {
    if (super.isAutopayEnabled != value) {
      _$isAutopayEnabledAtom.reportWrite(value, super.isAutopayEnabled, () {
        super.isAutopayEnabled = value;
      });
    }
  }

  late final _$isBillOverdueAtom =
      Atom(name: 'ProbiusBase.isBillOverdue', context: context);

  @override
  bool get isBillOverdue {
    _$isBillOverdueAtom.reportRead();
    return super.isBillOverdue;
  }

  @override
  set isBillOverdue(bool value) {
    if (super.isBillOverdue != value) {
      _$isBillOverdueAtom.reportWrite(value, super.isBillOverdue, () {
        super.isBillOverdue = value;
      });
    }
  }

  late final _$isClosedAtom =
      Atom(name: 'ProbiusBase.isClosed', context: context);

  @override
  bool get isClosed {
    _$isClosedAtom.reportRead();
    return super.isClosed;
  }

  @override
  set isClosed(bool value) {
    if (super.isClosed != value) {
      _$isClosedAtom.reportWrite(value, super.isClosed, () {
        super.isClosed = value;
      });
    }
  }

  late final _$isInArrearsAtom =
      Atom(name: 'ProbiusBase.isInArrears', context: context);

  @override
  bool get isInArrears {
    _$isInArrearsAtom.reportRead();
    return super.isInArrears;
  }

  @override
  set isInArrears(bool value) {
    if (super.isInArrears != value) {
      _$isInArrearsAtom.reportWrite(value, super.isInArrears, () {
        super.isInArrears = value;
      });
    }
  }

  late final _$notesAtom = Atom(name: 'ProbiusBase.notes', context: context);

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

  late final _$timeLastBillIssuedAtom =
      Atom(name: 'ProbiusBase.timeLastBillIssued', context: context);

  @override
  int get timeLastBillIssued {
    _$timeLastBillIssuedAtom.reportRead();
    return super.timeLastBillIssued;
  }

  @override
  set timeLastBillIssued(int value) {
    if (super.timeLastBillIssued != value) {
      _$timeLastBillIssuedAtom.reportWrite(value, super.timeLastBillIssued, () {
        super.timeLastBillIssued = value;
      });
    }
  }

  late final _$timeLastPaidOffAtom =
      Atom(name: 'ProbiusBase.timeLastPaidOff', context: context);

  @override
  int get timeLastPaidOff {
    _$timeLastPaidOffAtom.reportRead();
    return super.timeLastPaidOff;
  }

  @override
  set timeLastPaidOff(int value) {
    if (super.timeLastPaidOff != value) {
      _$timeLastPaidOffAtom.reportWrite(value, super.timeLastPaidOff, () {
        super.timeLastPaidOff = value;
      });
    }
  }

  late final _$timeCreatedAtom =
      Atom(name: 'ProbiusBase.timeCreated', context: context);

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

  late final _$tokensBoughtAtom =
      Atom(name: 'ProbiusBase.tokensBought', context: context);

  @override
  int get tokensBought {
    _$tokensBoughtAtom.reportRead();
    return super.tokensBought;
  }

  @override
  set tokensBought(int value) {
    if (super.tokensBought != value) {
      _$tokensBoughtAtom.reportWrite(value, super.tokensBought, () {
        super.tokensBought = value;
      });
    }
  }

  late final _$tokensUsedAtom =
      Atom(name: 'ProbiusBase.tokensUsed', context: context);

  @override
  int get tokensUsed {
    _$tokensUsedAtom.reportRead();
    return super.tokensUsed;
  }

  @override
  set tokensUsed(int value) {
    if (super.tokensUsed != value) {
      _$tokensUsedAtom.reportWrite(value, super.tokensUsed, () {
        super.tokensUsed = value;
      });
    }
  }

  late final _$ProbiusBaseActionController =
      ActionController(name: 'ProbiusBase', context: context);

  @override
  void loadFromAltProbius(Probius alt) {
    final _$actionInfo = _$ProbiusBaseActionController.startAction(
        name: 'ProbiusBase.loadFromAltProbius');
    try {
      return super.loadFromAltProbius(alt);
    } finally {
      _$ProbiusBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
probiusId: ${probiusId},
creatorId: ${creatorId},
defaultPlasticId: ${defaultPlasticId},
projectId: ${projectId},
stripeCustomerId: ${stripeCustomerId},
credit: ${credit},
debt: ${debt},
firstPeriod: ${firstPeriod},
isAutopayEnabled: ${isAutopayEnabled},
isBillOverdue: ${isBillOverdue},
isClosed: ${isClosed},
isInArrears: ${isInArrears},
notes: ${notes},
timeLastBillIssued: ${timeLastBillIssued},
timeLastPaidOff: ${timeLastPaidOff},
timeCreated: ${timeCreated},
tokensBought: ${tokensBought},
tokensUsed: ${tokensUsed},
firstBillingPeriodAsString: ${firstBillingPeriodAsString},
firstBillingMonth: ${firstBillingMonth},
firstBillingYear: ${firstBillingYear},
isAutopayEnabledString: ${isAutopayEnabledString},
tokensRemaining: ${tokensRemaining}
    ''';
  }
}
