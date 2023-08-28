import 'package:tui_lib/tui_lib.dart';

class PaymentFailedPage extends StatelessWidget {
  const PaymentFailedPage({required this.probiusId});
  final String probiusId;

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: Column(children: <Widget>[
        const BaText(
            'We\'re sorry, but your payment failed. This could be due to fraud prevention on your card, or another reason. You can try to pay again by entering your full card details again '),
        const SizedBox(height: 20),
        FunctionCard(
          text: 'Return to home',
          onTap: () {
            context.go(Routes.home);
          },
        ),
      ]),
    );
  }
}
