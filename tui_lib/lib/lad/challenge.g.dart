// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Challenge on ChallengeBase, Store {
  late final _$challengeIdAtom =
      Atom(name: 'ChallengeBase.challengeId', context: context);

  @override
  String get challengeId {
    _$challengeIdAtom.reportRead();
    return super.challengeId;
  }

  @override
  set challengeId(String value) {
    if (super.challengeId != value) {
      _$challengeIdAtom.reportWrite(value, super.challengeId, () {
        super.challengeId = value;
      });
    }
  }

  late final _$surferIdAtom =
      Atom(name: 'ChallengeBase.surferId', context: context);

  @override
  String get surferId {
    _$surferIdAtom.reportRead();
    return super.surferId;
  }

  @override
  set surferId(String value) {
    if (super.surferId != value) {
      _$surferIdAtom.reportWrite(value, super.surferId, () {
        super.surferId = value;
      });
    }
  }

  late final _$targetPropertyIdAtom =
      Atom(name: 'ChallengeBase.targetPropertyId', context: context);

  @override
  String get targetPropertyId {
    _$targetPropertyIdAtom.reportRead();
    return super.targetPropertyId;
  }

  @override
  set targetPropertyId(String value) {
    if (super.targetPropertyId != value) {
      _$targetPropertyIdAtom.reportWrite(value, super.targetPropertyId, () {
        super.targetPropertyId = value;
      });
    }
  }

  late final _$timeCreatedAtom =
      Atom(name: 'ChallengeBase.timeCreated', context: context);

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
challengeId: ${challengeId},
surferId: ${surferId},
targetPropertyId: ${targetPropertyId},
timeCreated: ${timeCreated}
    ''';
  }
}
