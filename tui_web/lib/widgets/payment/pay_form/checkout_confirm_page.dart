import 'package:tui_lib/tui_lib.dart';

const String freezePage = 'Your payment is processing.';
const String freezePageFailure =
    'Checkout failed. This page has been frozen to prevent double-payments. Please try again, and email us if the issue persists';

class CheckoutConfirmPage extends StatefulWidget {
  const CheckoutConfirmPage({
    required this.paymentDetails,
    required this.probiusId,
  });
  final PaymentDetails paymentDetails;
  final String probiusId;

  @override
  CheckoutConfirmPageState createState() => CheckoutConfirmPageState();
}

class CheckoutConfirmPageState extends State<CheckoutConfirmPage> {
  String _failureMsg = '';
  late PaymentDetails _pd;
  bool _requestInProgress = false;

  List<Widget> _buildBasketItemRows() {
    List<Widget> rows = [];
    for (final item in widget.paymentDetails.basketItems) {
      rows.add(SimpleRow(
        left: item.name,
        right: '\$${item.price.uncents}',
      ));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    _pd = widget.paymentDetails;

    return WebScaffold(
      body: Observer(builder: (_) {
        var selectedPlastic =
            PlasticProxy.of(context).getById(_pd.plasticId, disableApi: true);

        return Column(children: <Widget>[
          const BaText('Bill'),
          //BaText(widget.probiusId),
          const SizedBox(height: 20),
          ..._buildBasketItemRows(),

          SimpleRow(
              left: 'Applied credit:', right: '-\$${_pd.creditMax.uncents}'),
          const SizedBox(
            width: 340,
            child: Divider(color: Colors.black),
          ),
          SimpleRow(
              left: 'Total price:',
              right: '\$${_pd.totalPriceAfterCredit.uncents}'),
          const SizedBox(height: 20),
          //

          _pd.isAutopaySelected
              ? const BaText(
                  'Autopay was selected. Your subscription will be automatically renewed in the future.')
              : const BaText(
                  'Autopay was not selected. Please make sure you add  payment method or money to your account'),
          const SizedBox(height: 12),

          _pd.isBtcpay
              ? const BaText(
                  'You chose to pay in crypto. The next screen will contain steps to finish checking out.')
              : const SizedBox.shrink(),

          _pd.isStripe
              ? const BaText('Our card payments are powered by Stripe\u2122.')
              : const SizedBox.shrink(),
          const SizedBox(height: 12),

          _pd.isPlasticIdNotEmptyNorUnlisted
              ? const BaText('You have selected to pay with')
              : const SizedBox.shrink(),
          const SizedBox(height: 12),

          _pd.isPlasticIdNotEmptyNorUnlisted
              ? SizedBox(
                  width: 240,
                  child: PlasticSlab(plastic: selectedPlastic),
                )
              : const SizedBox.shrink(),

          const SizedBox(height: 12),
          FunctionCard(
            text: 'Pay now',
            onTap: _pd.isReadyForCheckout &&
                    !_requestInProgress &&
                    _failureMsg == ''
                ? () {
                    _onSubmit(context);
                  }
                : null,
          ),

          FailureMsg(_failureMsg),
          const SizedBox(height: 12),
          _failureMsg.isEmpty
              ? const SizedBox.shrink()
              : TextButton(
                  child: const BaText('Go to Home'),
                  onPressed: () {
                    context.go(Routes.home);
                  },
                ),

          _requestInProgress ? LoadingWidget() : const SizedBox.shrink(),
        ]);
      }),
    );
  }

  Future<void> _onSubmit(BuildContext context) async {
    if (!_requestInProgress) {
      setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      final king = King.of(context);
      ApiResponse ares = await king.lip.api(
        EndpointsV2.stripePay,
        payload: _pd.asStripePayload(king),
      );

      setState(() {
        _requestInProgress = false;
      });

      if (ares.isOk) {
        var status = readString(ares.body, 'Status');
        switch (status) {
          case 'failed':
            setState(() {
              _failureMsg = freezePageFailure;
            });
            break;

          case 'success':
            setState(() {
              _failureMsg = freezePage;
            });
            if (!mounted) return;
            context.goNamed(
              Routes.paymentThankYou,
              params: Args(probiusId: widget.probiusId).asMap(),
            );
            break;

          case 'waitForStripe':
            setState(() {
              _failureMsg = freezePage;
            });
            var paymentAttemptId = readString(ares.body, 'PaymentAttemptId');
            var stripeUrl = readString(ares.body, 'StripeUrl');

            if (!mounted) return;

            context.goNamed(
              Routes.paymentWaitForStripe,
              params: Args(
                paymentAttemptId: paymentAttemptId,
                probiusId: widget.probiusId,
                stripeUrl: stripeUrl,
              ).asMap(),
            );
            break;

          default:
            setState(() {
              _failureMsg = freezePageFailure;
            });
            king.plog.wtf('invalid payment status passed from papi.');
        }
      } else {
        setState(() {
          _failureMsg = freezePageFailure;
        });
      }
    }
  }
}
