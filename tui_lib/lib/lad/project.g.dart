// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Project on ProjectBase, Store {
  Computed<String>? _$timePlanExpiresForDisplayComputed;

  @override
  String get timePlanExpiresForDisplay =>
      (_$timePlanExpiresForDisplayComputed ??= Computed<String>(
              () => super.timePlanExpiresForDisplay,
              name: 'ProjectBase.timePlanExpiresForDisplay'))
          .value;
  Computed<bool>? _$mustChangePlanNowComputed;

  @override
  bool get mustChangePlanNow => (_$mustChangePlanNowComputed ??= Computed<bool>(
          () => super.mustChangePlanNow,
          name: 'ProjectBase.mustChangePlanNow'))
      .value;
  Computed<bool>? _$isPlanChangingComputed;

  @override
  bool get isPlanChanging =>
      (_$isPlanChangingComputed ??= Computed<bool>(() => super.isPlanChanging,
              name: 'ProjectBase.isPlanChanging'))
          .value;

  late final _$projectIdAtom =
      Atom(name: 'ProjectBase.projectId', context: context);

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

  late final _$creatorIdAtom =
      Atom(name: 'ProjectBase.creatorId', context: context);

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

  late final _$planIdAtom = Atom(name: 'ProjectBase.planId', context: context);

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

  late final _$planIdNextAtom =
      Atom(name: 'ProjectBase.planIdNext', context: context);

  @override
  String get planIdNext {
    _$planIdNextAtom.reportRead();
    return super.planIdNext;
  }

  @override
  set planIdNext(String value) {
    if (super.planIdNext != value) {
      _$planIdNextAtom.reportWrite(value, super.planIdNext, () {
        super.planIdNext = value;
      });
    }
  }

  late final _$probiusIdAtom =
      Atom(name: 'ProjectBase.probiusId', context: context);

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

  late final _$nameAtom = Atom(name: 'ProjectBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    if (super.name != value) {
      _$nameAtom.reportWrite(value, super.name, () {
        super.name = value;
      });
    }
  }

  late final _$notesAtom = Atom(name: 'ProjectBase.notes', context: context);

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

  late final _$timePlanExpiresAtom =
      Atom(name: 'ProjectBase.timePlanExpires', context: context);

  @override
  int get timePlanExpires {
    _$timePlanExpiresAtom.reportRead();
    return super.timePlanExpires;
  }

  @override
  set timePlanExpires(int value) {
    if (super.timePlanExpires != value) {
      _$timePlanExpiresAtom.reportWrite(value, super.timePlanExpires, () {
        super.timePlanExpires = value;
      });
    }
  }

  late final _$timeCreatedAtom =
      Atom(name: 'ProjectBase.timeCreated', context: context);

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
projectId: ${projectId},
creatorId: ${creatorId},
planId: ${planId},
planIdNext: ${planIdNext},
probiusId: ${probiusId},
name: ${name},
notes: ${notes},
timePlanExpires: ${timePlanExpires},
timeCreated: ${timeCreated},
timePlanExpiresForDisplay: ${timePlanExpiresForDisplay},
mustChangePlanNow: ${mustChangePlanNow},
isPlanChanging: ${isPlanChanging}
    ''';
  }
}
