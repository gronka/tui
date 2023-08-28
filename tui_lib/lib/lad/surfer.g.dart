// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surfer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Surfer on SurferBase, Store {
  Computed<String>? _$firstNameIsComputed;

  @override
  String get firstNameIs =>
      (_$firstNameIsComputed ??= Computed<String>(() => super.firstNameIs,
              name: 'SurferBase.firstNameIs'))
          .value;
  Computed<String>? _$lastNameIsComputed;

  @override
  String get lastNameIs =>
      (_$lastNameIsComputed ??= Computed<String>(() => super.lastNameIs,
              name: 'SurferBase.lastNameIs'))
          .value;

  late final _$surferIdAtom =
      Atom(name: 'SurferBase.surferId', context: context);

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

  late final _$projectIdAtom =
      Atom(name: 'SurferBase.projectId', context: context);

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

  late final _$emailAtom = Atom(name: 'SurferBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    if (super.email != value) {
      _$emailAtom.reportWrite(value, super.email, () {
        super.email = value;
      });
    }
  }

  late final _$phoneAtom = Atom(name: 'SurferBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    if (super.phone != value) {
      _$phoneAtom.reportWrite(value, super.phone, () {
        super.phone = value;
      });
    }
  }

  late final _$isEmailVerifiedAtom =
      Atom(name: 'SurferBase.isEmailVerified', context: context);

  @override
  bool get isEmailVerified {
    _$isEmailVerifiedAtom.reportRead();
    return super.isEmailVerified;
  }

  @override
  set isEmailVerified(bool value) {
    if (super.isEmailVerified != value) {
      _$isEmailVerifiedAtom.reportWrite(value, super.isEmailVerified, () {
        super.isEmailVerified = value;
      });
    }
  }

  late final _$isPhoneVerifiedAtom =
      Atom(name: 'SurferBase.isPhoneVerified', context: context);

  @override
  bool get isPhoneVerified {
    _$isPhoneVerifiedAtom.reportRead();
    return super.isPhoneVerified;
  }

  @override
  set isPhoneVerified(bool value) {
    if (super.isPhoneVerified != value) {
      _$isPhoneVerifiedAtom.reportWrite(value, super.isPhoneVerified, () {
        super.isPhoneVerified = value;
      });
    }
  }

  late final _$firstNameAtom =
      Atom(name: 'SurferBase.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    if (super.firstName != value) {
      _$firstNameAtom.reportWrite(value, super.firstName, () {
        super.firstName = value;
      });
    }
  }

  late final _$lastNameAtom =
      Atom(name: 'SurferBase.lastName', context: context);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    if (super.lastName != value) {
      _$lastNameAtom.reportWrite(value, super.lastName, () {
        super.lastName = value;
      });
    }
  }

  @override
  String toString() {
    return '''
surferId: ${surferId},
projectId: ${projectId},
email: ${email},
phone: ${phone},
isEmailVerified: ${isEmailVerified},
isPhoneVerified: ${isPhoneVerified},
firstName: ${firstName},
lastName: ${lastName},
firstNameIs: ${firstNameIs},
lastNameIs: ${lastNameIs}
    ''';
  }
}
