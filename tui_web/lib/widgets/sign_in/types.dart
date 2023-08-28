import 'package:tui_lib/tui_lib.dart';

class AuthFormFields {
  String email = '';
  String password = '';
}

enum AuthPages { signIn, register }

extension Functions on AuthPages {
  String get banner {
    switch (this) {
      case AuthPages.register:
        return 'Create your account.';
      case AuthPages.signIn:
        return 'Sign in to your account.';
    }
  }

  String get buttonTitle {
    switch (this) {
      case AuthPages.register:
        return 'Register';
      case AuthPages.signIn:
        return 'Sign in';
    }
  }

  String get failedMessage {
    switch (this) {
      case AuthPages.register:
        return 'Failed to register.';
      case AuthPages.signIn:
        return 'Failed to sign in.';
    }
  }

  String get nextPage {
    switch (this) {
      case AuthPages.register:
        return Routes.confirmEmail;
      case AuthPages.signIn:
        return Routes.challenges;
    }
  }

  Future<ApiResponse> performAuth(
    BuildContext context,
    AuthFormFields fields,
  ) async {
    var todd = King.of(context).todd;
    switch (this) {
      case AuthPages.register:
        return await todd.registerWithEmail(
            email: fields.email, password: fields.password);

      case AuthPages.signIn:
        return await todd.signInWithEmail(
            email: fields.email, password: fields.password);
    }
  }
}
