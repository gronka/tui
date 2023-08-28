import 'package:tui_lib/tui_lib.dart';

class CheckoutCryptoPage extends StatefulWidget {
  const CheckoutCryptoPage({required this.amount, required this.projectId});
  final String amount;
  final String projectId;

  @override
  CheckoutCryptoPageState createState() => CheckoutCryptoPageState();
}

class CheckoutCryptoPageState extends State<CheckoutCryptoPage> {
  String _failureMsg = '';
  bool _requestInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('You will be charged ${widget.amount}'),
      const SizedBox(height: 24),
      const Text('Which crypto type'),
      const SizedBox(height: 24),
      TextButton(
        child: const Text('Submit payment'),
        onPressed: () {
          _onSubmit(context);
        },
      ),
      _failureMsg != '' ? Text(_failureMsg) : const SizedBox.shrink(),
    ]);
  }

  Future<void> _onSubmit(BuildContext context) async {
    if (!_requestInProgress) {
      this.setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await King.of(context).lip.api(
        EndpointsV2.paymentCheckoutCrypto,
        payload: {
          'Amount': widget.amount,
          'ProbiusId': widget.projectId,
        },
      );

      this.setState(() {
        _requestInProgress = false;
      });
      if (ares.isOk) {
        if (!mounted) return;
        context.goNamed(
          Routes.paymentCryptoAddress,
          params: Args(amount: widget.amount).asMap(),
        );
      } else {
        this.setState(() {
          _failureMsg = 'Failed to checkout. Try again.';
        });
      }
    }
  }
}
