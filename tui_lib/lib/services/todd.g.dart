// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todd.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Todd on ToddBase, Store {
  Computed<bool>? _$appleNeedsRefreshComputed;

  @override
  bool get appleNeedsRefresh => (_$appleNeedsRefreshComputed ??= Computed<bool>(
          () => super.appleNeedsRefresh,
          name: 'ToddBase.appleNeedsRefresh'))
      .value;
  Computed<bool>? _$googleNeedsRefreshComputed;

  @override
  bool get googleNeedsRefresh => (_$googleNeedsRefreshComputed ??=
          Computed<bool>(() => super.googleNeedsRefresh,
              name: 'ToddBase.googleNeedsRefresh'))
      .value;
  Computed<bool>? _$isSignedInComputed;

  @override
  bool get isSignedIn => (_$isSignedInComputed ??=
          Computed<bool>(() => super.isSignedIn, name: 'ToddBase.isSignedIn'))
      .value;

  late final _$clockFormatAtom =
      Atom(name: 'ToddBase.clockFormat', context: context);

  @override
  ClockFormat get clockFormat {
    _$clockFormatAtom.reportRead();
    return super.clockFormat;
  }

  @override
  set clockFormat(ClockFormat value) {
    if (super.clockFormat != value) {
      _$clockFormatAtom.reportWrite(value, super.clockFormat, () {
        super.clockFormat = value;
      });
    }
  }

  late final _$developerIdAtom =
      Atom(name: 'ToddBase.developerId', context: context);

  @override
  String get developerId {
    _$developerIdAtom.reportRead();
    return super.developerId;
  }

  @override
  set developerId(String value) {
    if (super.developerId != value) {
      _$developerIdAtom.reportWrite(value, super.developerId, () {
        super.developerId = value;
      });
    }
  }

  late final _$jwtShortAtom = Atom(name: 'ToddBase.jwtShort', context: context);

  @override
  String get jwtShort {
    _$jwtShortAtom.reportRead();
    return super.jwtShort;
  }

  @override
  set jwtShort(String value) {
    if (super.jwtShort != value) {
      _$jwtShortAtom.reportWrite(value, super.jwtShort, () {
        super.jwtShort = value;
      });
    }
  }

  late final _$jwtLongAtom = Atom(name: 'ToddBase.jwtLong', context: context);

  @override
  String get jwtLong {
    _$jwtLongAtom.reportRead();
    return super.jwtLong;
  }

  @override
  set jwtLong(String value) {
    if (super.jwtLong != value) {
      _$jwtLongAtom.reportWrite(value, super.jwtLong, () {
        super.jwtLong = value;
      });
    }
  }

  late final _$localeAtom = Atom(name: 'ToddBase.locale', context: context);

  @override
  String get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(String value) {
    if (super.locale != value) {
      _$localeAtom.reportWrite(value, super.locale, () {
        super.locale = value;
      });
    }
  }

  late final _$statusAtom = Atom(name: 'ToddBase.status', context: context);

  @override
  AuthStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    if (super.status != value) {
      _$statusAtom.reportWrite(value, super.status, () {
        super.status = value;
      });
    }
  }

  late final _$surferIdAtom = Atom(name: 'ToddBase.surferId', context: context);

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

  late final _$toddModeAtom = Atom(name: 'ToddBase.toddMode', context: context);

  @override
  ToddMode get toddMode {
    _$toddModeAtom.reportRead();
    return super.toddMode;
  }

  @override
  set toddMode(ToddMode value) {
    if (super.toddMode != value) {
      _$toddModeAtom.reportWrite(value, super.toddMode, () {
        super.toddMode = value;
      });
    }
  }

  late final _$isAppleAccountAtom =
      Atom(name: 'ToddBase.isAppleAccount', context: context);

  @override
  bool get isAppleAccount {
    _$isAppleAccountAtom.reportRead();
    return super.isAppleAccount;
  }

  @override
  set isAppleAccount(bool value) {
    if (super.isAppleAccount != value) {
      _$isAppleAccountAtom.reportWrite(value, super.isAppleAccount, () {
        super.isAppleAccount = value;
      });
    }
  }

  late final _$isGoogleAccountAtom =
      Atom(name: 'ToddBase.isGoogleAccount', context: context);

  @override
  bool get isGoogleAccount {
    _$isGoogleAccountAtom.reportRead();
    return super.isGoogleAccount;
  }

  @override
  set isGoogleAccount(bool value) {
    if (super.isGoogleAccount != value) {
      _$isGoogleAccountAtom.reportWrite(value, super.isGoogleAccount, () {
        super.isGoogleAccount = value;
      });
    }
  }

  late final _$povAtom = Atom(name: 'ToddBase.pov', context: context);

  @override
  Pov get pov {
    _$povAtom.reportRead();
    return super.pov;
  }

  @override
  set pov(Pov value) {
    if (super.pov != value) {
      _$povAtom.reportWrite(value, super.pov, () {
        super.pov = value;
      });
    }
  }

  late final _$tryJwtShortOrSignOutAsyncAction =
      AsyncAction('ToddBase.tryJwtShortOrSignOut', context: context);

  @override
  Future<void> tryJwtShortOrSignOut(ApiResponse ares) {
    return _$tryJwtShortOrSignOutAsyncAction
        .run(() => super.tryJwtShortOrSignOut(ares));
  }

  late final _$signOutAsyncAction =
      AsyncAction('ToddBase.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$registerWithEmailAsyncAction =
      AsyncAction('ToddBase.registerWithEmail', context: context);

  @override
  Future<ApiResponse> registerWithEmail(
      {required String email, required String password}) {
    return _$registerWithEmailAsyncAction
        .run(() => super.registerWithEmail(email: email, password: password));
  }

  late final _$signInWithEmailAsyncAction =
      AsyncAction('ToddBase.signInWithEmail', context: context);

  @override
  Future<ApiResponse> signInWithEmail(
      {required String email, required String password}) {
    return _$signInWithEmailAsyncAction
        .run(() => super.signInWithEmail(email: email, password: password));
  }

  late final _$signInWithGoogleAsyncAction =
      AsyncAction('ToddBase.signInWithGoogle', context: context);

  @override
  Future<ApiResponse> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  late final _$signInWithAppleAsyncAction =
      AsyncAction('ToddBase.signInWithApple', context: context);

  @override
  Future<ApiResponse> signInWithApple() {
    return _$signInWithAppleAsyncAction.run(() => super.signInWithApple());
  }

  late final _$ToddBaseActionController =
      ActionController(name: 'ToddBase', context: context);

  @override
  void processSignInResponse(ApiResponse ares) {
    final _$actionInfo = _$ToddBaseActionController.startAction(
        name: 'ToddBase.processSignInResponse');
    try {
      return super.processSignInResponse(ares);
    } finally {
      _$ToddBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clockFormat: ${clockFormat},
developerId: ${developerId},
jwtShort: ${jwtShort},
jwtLong: ${jwtLong},
locale: ${locale},
status: ${status},
surferId: ${surferId},
toddMode: ${toddMode},
isAppleAccount: ${isAppleAccount},
isGoogleAccount: ${isGoogleAccount},
pov: ${pov},
appleNeedsRefresh: ${appleNeedsRefresh},
googleNeedsRefresh: ${googleNeedsRefresh},
isSignedIn: ${isSignedIn}
    ''';
  }
}
