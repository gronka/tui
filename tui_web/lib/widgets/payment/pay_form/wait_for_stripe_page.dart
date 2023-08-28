import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

import 'package:tui_lib/tui_lib.dart';

const paymentAttemptStatusSuccess = 10;
const paymentAttemptStatusWaiting = 20;
const paymentAttemptStatusFailed = 30;

class WaitForStripePage extends StatefulWidget {
  const WaitForStripePage({
    required this.paymentAttemptId,
    required this.probiusId,
    required this.stripeUrl,
  });
  final String paymentAttemptId;
  final String probiusId;
  final String stripeUrl;

  @override
  WaitForStripePageState createState() => WaitForStripePageState();
}

class WaitForStripePageState extends State<WaitForStripePage> {
  String _failureMsg = '';
  late Timer _statusTimer;
  late Timer _timeoutTimer;
  bool _waiting = true;

  @override
  initState() {
    super.initState();
    _statusTimer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      checkPaymentAttemptStatus();
    });
    _timeoutTimer = Timer.periodic(const Duration(minutes: 3), (Timer t) {
      _statusTimer.cancel();
      setState(() {
        _failureMsg =
            'Payment is taking a long time to process. If your payment failed in the Stripe website, then you will have to checkout again.';
      });
    });

    launchStripeWebsite();
  }

  @override
  dispose() {
    _statusTimer.cancel();
    _timeoutTimer.cancel();
    super.dispose();
  }

  launchStripeWebsite() async {
    if (!await launchUrl(Uri.parse(widget.stripeUrl))) {
      if (!mounted) return;
      King.of(context).snacker.addSnack(Snacks.stripeLaunchError);
    }
  }

  Future<void> checkPaymentAttemptStatus() async {
    ApiResponse ares = await King.of(context).lip.api(
      EndpointsV2.paymentAttemptStatusGetAndHandle,
      payload: {
        'PaymentAttemptId': widget.paymentAttemptId,
      },
    );

    if (ares.isOk) {
      var status = readInt(ares.body, 'Status');
      if (!mounted) return;
      switch (status) {
        case paymentAttemptStatusSuccess:
          _statusTimer.cancel();
          setState(() {
            _failureMsg = '';
            _waiting = false;
          });
          context.goNamed(
            Routes.paymentThankYou,
            params: Args(probiusId: widget.probiusId).asMap(),
          );
          break;

        case paymentAttemptStatusWaiting:
          // keep waiting
          break;

        case paymentAttemptStatusFailed:
          _statusTimer.cancel();
          setState(() {
            _failureMsg = 'Payment failed.';
            _waiting = false;
          });
          context.goNamed(
            Routes.paymentFailed,
            params: Args(probiusId: widget.probiusId).asMap(),
          );
          break;

        default:
          _statusTimer.cancel();
          King.of(context).plog.i('payment failed ${widget.paymentAttemptId}');
          context.goNamed(
            Routes.paymentFailed,
            params: Args(probiusId: widget.probiusId).asMap(),
          );
          King.of(context).snacker.addSnack(Snacks.paymentError);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: Column(children: <Widget>[
        const SizedBox(height: 20),
        const BaText('Your payment must be completed in an external window.'),
        _waiting ? LoadingWidget() : const SizedBox.shrink(),
        const SizedBox(height: 20),
        _failureMsg != '' ? BaText(_failureMsg) : const SizedBox.shrink(),
        const SizedBox(height: 20),
      ]),
    );
  }
}
