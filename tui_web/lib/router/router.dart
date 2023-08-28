import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/archive/archive_page.dart';
import 'package:tui_web/widgets/challenge/challenges_page.dart';
import 'package:tui_web/widgets/challenge/create_page.dart';
import 'package:tui_web/widgets/challenge/overview_page.dart';
import 'package:tui_web/widgets/console/console_page.dart';
import 'package:tui_web/widgets/home_page.dart';
import 'package:tui_web/widgets/property/properties_page.dart';
import 'package:tui_web/widgets/property/create_page.dart';
import 'package:tui_web/widgets/property/delete_page.dart';
import 'package:tui_web/widgets/property/overview_page.dart';
//import 'package:tui_web/widgets/welcome/page.dart';
import 'package:tui_web/widgets/iframe_page.dart';

import 'package:tui_web/router/payment.dart';
import 'package:tui_web/router/sign_in.dart';
import 'package:tui_web/router/surfer.dart';
import 'package:tui_web/widgets/plan/change_page.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  // the default error builder seems fine
  //errorBuilder: (context, state) => ErrorScreen(state.error),
  navigatorKey: appNavigatorKey,
  initialLocation: Routes.home,
  routes: [
    ...paymentRoutes,
    ...signInRoutes,
    ...surferRoutes,
    //
    GoRoute(
      path: Routes.archive,
      builder: (BuildContext context, GoRouterState state) {
        return ArchivePage();
      },
    ),

    GoRoute(
      path: Routes.challenges,
      builder: (BuildContext context, GoRouterState state) {
        return const ChallengesPage();
      },
    ),

    GoRoute(
      name: Routes.challengeCreate,
      path: '${Routes.challengeCreate}/:propertyId',
      builder: (BuildContext context, GoRouterState state) {
        final args = Args.fromMap(state.params);
        return ChallengeCreatePage(propertyId: args.propertyId);
      },
    ),

    GoRoute(
      name: Routes.challengeOverview,
      path: '${Routes.challengeOverview}/:challengeId',
      builder: (BuildContext context, GoRouterState state) {
        final args = Args.fromMap(state.params);
        return ChallengeOverviewPage(challengeId: args.challengeId);
      },
    ),

    GoRoute(
      path: Routes.properties,
      builder: (BuildContext context, GoRouterState state) {
        return PropertiesPage();
      },
    ),

    GoRoute(
      path: Routes.propertyCreate,
      builder: (BuildContext context, GoRouterState state) {
        return PropertyCreatePage();
      },
    ),

    GoRoute(
      name: Routes.propertyDelete,
      path: '${Routes.propertyDelete}/:propertyId',
      builder: (BuildContext context, GoRouterState state) {
        final args = Args.fromMap(state.params);
        return PropertyDeletePage(propertyId: args.propertyId);
      },
    ),

    GoRoute(
      name: Routes.propertyOverview,
      path: '${Routes.propertyOverview}/:propertyId',
      builder: (BuildContext context, GoRouterState state) {
        final args = Args.fromMap(state.params);
        return PropertyOverviewPage(propertyId: args.propertyId);
      },
    ),

    GoRoute(
      path: Routes.console,
      builder: (BuildContext context, GoRouterState state) {
        return ConsolePage();
      },
    ),

    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),

    GoRoute(
      path: Routes.welcome,
      builder: (BuildContext context, GoRouterState state) {
        return IFramePage(
            elId: Routes.welcome,
            url: '${AppConf.siteUrl}/static/welcome.html');
      },
    ),

    GoRoute(
      path: Routes.contact,
      builder: (BuildContext context, GoRouterState state) {
        return IFramePage(
            elId: Routes.contact,
            url: '${AppConf.siteUrl}/static/welcome.html#contact');
      },
    ),

    GoRoute(
      path: Routes.terms,
      builder: (BuildContext context, GoRouterState state) {
        return IFramePage(
            elId: Routes.terms, url: '${AppConf.siteUrl}/static/terms.html');
      },
    ),

    GoRoute(
      path: Routes.faq,
      builder: (BuildContext context, GoRouterState state) {
        return IFramePage(
            elId: Routes.faq, url: '${AppConf.siteUrl}/static/faq.html');
      },
    ),

    GoRoute(
      path: Routes.privacy,
      builder: (BuildContext context, GoRouterState state) {
        return IFramePage(
            elId: Routes.privacy,
            url: '${AppConf.siteUrl}/static/privacy.html');
      },
    ),

    // Plan pages
    GoRoute(
      name: Routes.planChange,
      path: '${Routes.planChange}/:projectId/:planId',
      builder: (BuildContext context, GoRouterState state) {
        final args = Args.fromMap(state.params);
        return PlanChangePage(planId: args.planId, projectId: args.projectId);
      },
    ),
  ],
);
