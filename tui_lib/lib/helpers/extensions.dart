import 'package:intl/intl.dart' as intl;

import 'package:tui_lib/tui_lib.dart';

extension TuiLib on BuildContext {
  Plogger get plog {
    return King.of(this).plog;
  }
}

extension ParseCents on int {
  String get uncents {
    //NOTE: add a tiny bit to make it positive
    return (this / 100.0 + .0000001).toStringAsFixed(2);
  }

  String get toUsd {
    return '\$${this.uncents}';
  }

  String get display {
    return intl.NumberFormat.decimalPattern().format(this);
  }

  String get pad02 {
    return intl.NumberFormat('00').format(this);
  }
}

extension ToddModeExtensions on ToddMode {
  String get refreshEndpoint {
    return EndpointsV2.surferJwtRefresh;
  }

  String get registerWithEmailEndpoint {
    return EndpointsV2.surferRegisterWithEmail;
  }

  String get signInWithAppleEndpoint {
    return EndpointsV2.surferSignInWithApple;
  }

  String get signInWithEmailEndpoint {
    return EndpointsV2.surferSignInWithEmail;
  }

  String get signInWithGoogleEndpoint {
    return EndpointsV2.surferSignInWithGoogle;
  }

  String get signOutEndpoint {
    return EndpointsV2.surferSignOut;
  }
}
