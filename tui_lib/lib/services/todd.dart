import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'todd.g.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
// Optional clientId
// clientId: '...m2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
  ],
);

enum AuthStatus {
  errored,
  initialized,
  loading,
  signedIn,
  signedOut,
}

enum Pov {
  admin,
  host,
  surfer,
}

class Todd = ToddBase with _$Todd;

abstract class ToddBase with Store {
  ToddBase(this.king);

  King king;
  @observable
  ClockFormat clockFormat = ClockFormat.twentyFour;
  @observable
  String developerId = '';
  @observable
  String jwtShort = '';
  @observable
  String jwtLong = '';
  @observable
  String locale = 'en';
  @observable
  AuthStatus status = AuthStatus.initialized;
  @observable
  String surferId = '';
  @observable
  ToddMode toddMode = ToddMode.none;

  @observable
  bool isAppleAccount = false;
  @observable
  bool isGoogleAccount = false;
  int googleLastRefresh = 0;

  @observable
  Pov pov = Pov.surfer;

  //GoogleSignInAccount? _googleAccount;

  Todd of(BuildContext context) {
    return King.of(context).todd;
  }

  @action
  Future<void> tryJwtShortOrSignOut(ApiResponse ares) async {
    String temp = ares.body['NewJwtShort'] ?? '';
    if (temp.isNotEmpty) {
      updateLogin(
        developerIdIn: developerId,
        jwtShortIn: temp,
        jwtLongIn: jwtLong,
        surferIdIn: surferId,
        isAppleAccount: isAppleAccount,
        isGoogleAccount: isGoogleAccount,
      );
    } else if (temp == 'signout') {
      signOut();
    }
  }

  @action
  void processSignInResponse(ApiResponse ares) {
    if (ares.body.containsKey('IsEmailVerified')) {
      bool isVerified = ares.body['IsEmailVerified'];
      if (!isVerified) {
        return;
      }
    }

    if (ares.body.containsKey('NewJwtShort')) {
      jwtShort = ares.body['NewJwtShort'];
    }

    if (ares.body.containsKey('NewJwtLong')) {
      jwtLong = ares.body['NewJwtLong'];
    }

    developerId = ares.body['DeveloperId'] ?? '';
    surferId = ares.body['SurferId'] ?? '';

    isAppleAccount = ares.body['IsAppleAccount'] ?? false;
    isGoogleAccount = ares.body['IsGoogleAccount'] ?? false;
    print('developer_id from server is +$developerId+');
    print('surfer_id from server is +$surferId+');

    if (jwtShort.isNotEmpty) {
      if (developerId.isNotEmpty) {
        status = AuthStatus.signedIn;
        updateLogin(
          developerIdIn: developerId,
          jwtShortIn: jwtShort,
          jwtLongIn: jwtLong,
          surferIdIn: '',
          isAppleAccount: isAppleAccount,
          isGoogleAccount: isGoogleAccount,
        );
      } else if (surferId.isNotEmpty) {
        status = AuthStatus.signedIn;
        updateLogin(
          developerIdIn: '',
          jwtShortIn: jwtShort,
          jwtLongIn: jwtLong,
          surferIdIn: surferId,
          isAppleAccount: isAppleAccount,
          isGoogleAccount: isGoogleAccount,
        );
      }
      print('process sign in success');
    } else {
      updateLogin(
        developerIdIn: '',
        jwtShortIn: '',
        jwtLongIn: '',
        surferIdIn: '',
        isAppleAccount: false,
        isGoogleAccount: false,
      );
      status = AuthStatus.errored;
      print('process sign in errored');
    }
  }

  void updateLogin({
    required String developerIdIn,
    required String jwtShortIn,
    required String jwtLongIn,
    required String surferIdIn,
    required bool isAppleAccount,
    required bool isGoogleAccount,
    bool forceAll = false,
  }) {
    developerId = developerIdIn;
    jwtShort = jwtShortIn;
    jwtLong = jwtLongIn;
    surferId = surferIdIn;

    if (jwtShortIn.isNotEmpty || forceAll) {
      king.box.put('jwtShort', jwtShortIn);
    }
    if (jwtLongIn.isNotEmpty || forceAll) {
      king.box.put('jwtLong', jwtLongIn);
    }

    king.box.put('developerId', developerIdIn);
    king.box.put('surferId', surferIdIn);

    king.box.put('isAppleAccount', isAppleAccount);
    king.box.put('isGoogleAccount', isGoogleAccount);
    king.box.put('googleLastRefresh', googleLastRefresh);

    king.plog.d(toString());
  }

  Future<void> loadLogin() async {
    developerId = king.box.get('developerId') ?? '';
    jwtShort = king.box.get('jwtShort') ?? '';
    jwtLong = king.box.get('jwtLong') ?? '';
    surferId = king.box.get('surferId') ?? '';

    isAppleAccount = king.box.get('isAppleAccount') ?? false;
    isGoogleAccount = king.box.get('isGoogleAccount') ?? false;
    googleLastRefresh = king.box.get('googleLastRefresh') ?? 0;

    if (developerId.isNotEmpty || surferId.isNotEmpty) {
      status = AuthStatus.signedIn;
    }

    if (googleNeedsRefresh) {
      signInWithGoogle();
    }

    if (appleNeedsRefresh) {
      signInWithApple();
    }

    king.plog.d(toString());
  }

  @computed
  bool get appleNeedsRefresh {
    if (isAppleAccount) {
      // 8.64e7 = 24 hours in ms
      if (googleLastRefresh - DateTime.now().millisecondsSinceEpoch > 8.64e7) {
        return true;
      }
    }
    return false;
  }

  @computed
  bool get googleNeedsRefresh {
    if (isGoogleAccount && king.conf.isAndroid) {
      // 8.64e7 = 24 hours in ms
      if (googleLastRefresh - DateTime.now().millisecondsSinceEpoch > 8.64e7) {
        return true;
      }
    }
    return false;
  }

  void attachSessionHeaders(Map<String, String> headers) {
    headers['JwtShort'] = jwtShort;
    headers['JwtLong'] = jwtLong;
  }

  @computed
  bool get isSignedIn {
    return status == AuthStatus.signedIn;
  }

  @action
  Future<void> signOut() async {
    //if (sessionJwt.isNotEmpty) {
    //ApiResponse ares = await king.lip.api(
    //toddMode.signOutEndpoint,
    //payload: {
    //'SessionJwt': sessionJwt,
    //},
    //);

    //if (ares.isNotOk) {
    //king.snacker.addSnack(Snacks.signOutError);
    //}
    //}

    signOutLocally();
  }

  void signOutLocally() {
    status = AuthStatus.signedOut;
    updateLogin(
      developerIdIn: '',
      jwtShortIn: '',
      jwtLongIn: '',
      surferIdIn: '',
      isAppleAccount: false,
      isGoogleAccount: false,
      forceAll: true,
    );
    king.signOutCleanup();
  }

  @action
  Future<ApiResponse> registerWithEmail({
    required String email,
    required String password,
  }) async {
    status = AuthStatus.loading;
    ApiResponse ares = await king.lip.api(
      toddMode.registerWithEmailEndpoint,
      payload: {
        'Email': email,
        'Password': password,
        'InstanceId': king.conf.instanceId,
        'Platform': king.conf.platform,
      },
    );

    if (ares.isOk) {
    } else {
      print('register with email failed, so forcing sign out');
      status = AuthStatus.signedOut;
    }
    return ares;
  }

  @action
  Future<ApiResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    status = AuthStatus.loading;
    ApiResponse ares = await king.lip.api(
      toddMode.signInWithEmailEndpoint,
      payload: {
        'Email': email,
        'Password': password,
        'InstanceId': king.conf.instanceId,
        'Platform': king.conf.platform,
      },
    );

    if (ares.isOk) {
      print('signing in with email');
      processSignInResponse(ares);
    } else {
      print('sign in with email failed');
      status = AuthStatus.signedOut;
    }
    return ares;
  }

  @action
  Future<ApiResponse> signInWithGoogle() async {
    status = AuthStatus.loading;

    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print('sign in with google failed: $error');
      status = AuthStatus.signedOut;
    }

    Map<String, String> headers =
        await _googleSignIn.currentUser?.authHeaders ?? {};
    String auth = headers['Authorization'] ?? '';
    String token = auth.replaceAll('Bearer ', '');

    ApiResponse ares = await king.lip.api(
      toddMode.signInWithGoogleEndpoint,
      payload: {
        'InstanceId': king.conf.instanceId,
        'Platform': king.conf.platform,
        'Token': token,
      },
    );

    if (ares.isOk) {
      print('signing in with google');
      processSignInResponse(ares);
    } else {
      print('sign in with google failed');
      signOut();
    }
    return ares;
  }

  @action
  Future<ApiResponse> signInWithApple() async {
    status = AuthStatus.loading;

    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          //AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: king.conf.signInWithAppleClientId,
          redirectUri: king.conf.signInWithAppleFairlyTaxedCallback,
        ),
      );

      ApiResponse ares = await king.lip.api(
        toddMode.signInWithAppleEndpoint,
        payload: {
          'AuthCode': credential.authorizationCode,
          //'ClientId': king.conf.signInWithAppleClientId,
          //'Email': credential.email ?? '',
          'IdToken': credential.identityToken,
          'InstanceId': king.conf.instanceId,
          'Platform': king.conf.platform,
        },
      );

      if (ares.isOk) {
        print('signing in with apple');
        processSignInResponse(ares);
      } else {
        print('sign in with apple failed');
        signOut();
      }
      return ares;
    } catch (error) {
      status = AuthStatus.signedOut;
    }

    return ApiResponse();
  }
}
