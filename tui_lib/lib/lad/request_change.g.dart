// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_change.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RequestChange on RequestChangeBase, Store {
  Computed<bool>? _$isExpiredOrConsumedComputed;

  @override
  bool get isExpiredOrConsumed => (_$isExpiredOrConsumedComputed ??=
          Computed<bool>(() => super.isExpiredOrConsumed,
              name: 'RequestChangeBase.isExpiredOrConsumed'))
      .value;

  late final _$surferIdAtom =
      Atom(name: 'RequestChangeBase.surferId', context: context);

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

  late final _$isConsumedAtom =
      Atom(name: 'RequestChangeBase.isConsumed', context: context);

  @override
  bool get isConsumed {
    _$isConsumedAtom.reportRead();
    return super.isConsumed;
  }

  @override
  set isConsumed(bool value) {
    if (super.isConsumed != value) {
      _$isConsumedAtom.reportWrite(value, super.isConsumed, () {
        super.isConsumed = value;
      });
    }
  }

  late final _$timeExpiresAtom =
      Atom(name: 'RequestChangeBase.timeExpires', context: context);

  @override
  int get timeExpires {
    _$timeExpiresAtom.reportRead();
    return super.timeExpires;
  }

  @override
  set timeExpires(int value) {
    if (super.timeExpires != value) {
      _$timeExpiresAtom.reportWrite(value, super.timeExpires, () {
        super.timeExpires = value;
      });
    }
  }

  late final _$tokenAtom =
      Atom(name: 'RequestChangeBase.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    if (super.token != value) {
      _$tokenAtom.reportWrite(value, super.token, () {
        super.token = value;
      });
    }
  }

  @override
  String toString() {
    return '''
surferId: ${surferId},
isConsumed: ${isConsumed},
timeExpires: ${timeExpires},
token: ${token},
isExpiredOrConsumed: ${isExpiredOrConsumed}
    ''';
  }
}
