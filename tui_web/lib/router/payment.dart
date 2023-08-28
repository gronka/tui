import 'package:tui_lib/tui_lib.dart';

//import 'package:tui_web/widgets/payment/bill_page.dart';
import 'package:tui_web/widgets/payment/add_credit_page.dart';
import 'package:tui_web/widgets/payment/pay_form/checkout_confirm_page.dart';
import 'package:tui_web/widgets/payment/pay_form/failed_page.dart';
import 'package:tui_web/widgets/payment/pay_form/thank_you_page.dart';
import 'package:tui_web/widgets/payment/pay_form/wait_for_stripe_page.dart';
import 'package:tui_web/widgets/payment/manage_autopay_page.dart';
import 'package:tui_web/widgets/payment/payment_page.dart';

final paymentRoutes = <GoRoute>[
  //
  //GoRoute(
  //name: Routes.surfer,
  //path: '${Routes.surfer}/:surferId',
  //builder: (BuildContext context, GoRouterState state) {
  //String projectId = state.params['projectId'] ?? '';
  //return BillPage(projectId);
  //},
  //),

  GoRoute(
    name: Routes.surferPayment,
    path: '${Routes.surferPayment}/:probiusId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return PaymentPage(probiusId: args.probiusId);
    },
  ),

  GoRoute(
    name: Routes.paymentAddCredit,
    path: '${Routes.paymentAddCredit}/:probiusId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return AddCreditPage(probiusId: args.probiusId);
    },
  ),

  GoRoute(
    name: Routes.paymentAutopay,
    path: '${Routes.paymentAutopay}/:probiusId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return ManageAutopayPage(probiusId: args.probiusId);
    },
  ),

  GoRoute(
    name: Routes.paymentCheckoutConfirm,
    path: '${Routes.paymentCheckoutConfirm}/:probiusId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      var pd = state.extra as PaymentDetails;
      return CheckoutConfirmPage(probiusId: args.probiusId, paymentDetails: pd);
    },
  ),

  GoRoute(
    name: Routes.paymentWaitForStripe,
    path:
        '${Routes.paymentWaitForStripe}/:probiusId/:paymentAttemptId/:stripeUrl',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return WaitForStripePage(
          paymentAttemptId: args.paymentAttemptId,
          probiusId: args.probiusId,
          stripeUrl: args.stripeUrl);
    },
  ),

  GoRoute(
    name: Routes.paymentFailed,
    path: '${Routes.paymentFailed}/:probiusId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return PaymentFailedPage(probiusId: args.probiusId);
    },
  ),

  GoRoute(
    name: Routes.paymentThankYou,
    path: '${Routes.paymentThankYou}/:probiusId',
    builder: (BuildContext context, GoRouterState state) {
      final args = Args.fromMap(state.params);
      return ThankYouPage(probiusId: args.probiusId);
    },
  ),
];
