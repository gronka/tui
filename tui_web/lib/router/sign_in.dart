import 'package:tui_lib/tui_lib.dart';

import 'package:tui_web/widgets/sign_in/confirm_email_page.dart';
import 'package:tui_web/widgets/sign_in/logged_out_change_password_page.dart';
import 'package:tui_web/widgets/sign_in/sign_in_page.dart';
import 'package:tui_web/widgets/sign_in/surfer_email_confirm_link_page.dart';

final signInRoutes = <GoRoute>[
  //
  GoRoute(
    path: Routes.signIn,
    builder: (BuildContext context, GoRouterState state) {
      return SignInPage();
    },
  ),

  GoRoute(
    path: Routes.confirmEmail,
    builder: (BuildContext context, GoRouterState state) {
      return ConfirmEmailPage();
    },
  ),

  GoRoute(
    name: Routes.surferEmailConfirmLink,
    path: '${Routes.surferEmailConfirmLink}/:token',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferEmailConfirmLinkPage(token: args.token);
    },
  ),

  GoRoute(
    name: Routes.loggedOutChangePasswordRequest,
    path: Routes.loggedOutChangePasswordRequest,
    builder: (BuildContext context, GoRouterState state) {
      return LoggedOutChangePasswordRequestPage();
    },
  ),
];
