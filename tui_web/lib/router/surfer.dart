import 'package:tui_lib/tui_lib.dart';

import 'package:tui_web/widgets/surfer/change_email_link_page.dart';
import 'package:tui_web/widgets/surfer/change_email_request_page.dart';
import 'package:tui_web/widgets/surfer/change_email_validate_new_link_page.dart';
import 'package:tui_web/widgets/surfer/change_password_link_page.dart';
import 'package:tui_web/widgets/surfer/change_password_request_page.dart';
import 'package:tui_web/widgets/surfer/plan_page.dart';
import 'package:tui_web/widgets/surfer/surfer_page.dart';
import 'package:tui_web/widgets/surfer/set_first_name_page.dart';
import 'package:tui_web/widgets/surfer/set_last_name_page.dart';
import 'package:tui_web/widgets/surfer/set_phone_page.dart';

final surferRoutes = <GoRoute>[
  // Change requests
  GoRoute(
    name: Routes.surferChangeEmailLink,
    path: '${Routes.surferChangeEmailLink}/:token',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferChangeEmailLinkPage(token: args.token);
    },
  ),

  GoRoute(
    name: Routes.surferChangeEmailRequest,
    path: '${Routes.surferChangeEmailRequest}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferChangeEmailRequestPage(surferId: args.surferId);
    },
  ),

  GoRoute(
    name: Routes.surferChangeEmailValidateNewLink,
    path: '${Routes.surferChangeEmailValidateNewLink}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferChangeEmailValidateNewLinkPage(token: args.token);
    },
  ),

  GoRoute(
    name: Routes.surferChangePasswordLink,
    path: '${Routes.surferChangePasswordLink}/:token',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferChangePasswordLinkPage(token: args.token);
    },
  ),

  GoRoute(
    name: Routes.surferChangePasswordRequest,
    path: '${Routes.surferChangePasswordRequest}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferChangePasswordRequestPage(surferId: args.surferId);
    },
  ),

  // Basic routes
  GoRoute(
    name: Routes.surfer,
    path: '${Routes.surfer}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferPage(surferId: args.surferId);
    },
  ),

  GoRoute(
    name: Routes.surferBilling,
    path: '${Routes.surferBilling}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferPage(surferId: args.surferId);
    },
  ),

  GoRoute(
    name: Routes.surferAccountAdministration,
    path: '${Routes.surferAccountAdministration}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferPage(surferId: args.surferId);
    },
  ),

  GoRoute(
    name: Routes.surferAccountClose,
    path: '${Routes.surferAccountClose}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferPage(surferId: args.surferId);
    },
  ),

  GoRoute(
    name: Routes.surferSetFirstName,
    path: '${Routes.surferSetFirstName}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferSetFirstNamePage(surferId: args.surferId);
    },
  ),

  GoRoute(
    name: Routes.surferSetLastName,
    path: '${Routes.surferSetLastName}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferSetLastNamePage(surferId: args.surferId);
    },
  ),

  GoRoute(
    name: Routes.surferSetPhone,
    path: '${Routes.surferSetPhone}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return SurferSetPhonePage(surferId: args.surferId);
    },
  ),

  GoRoute(
    name: Routes.surferPlan,
    path: '${Routes.surferPlan}/:surferId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return PlanPage(surferId: args.surferId);
    },
  ),
];
