import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/payment/pay_form/crypto_pay_form.dart';
import 'package:tui_web/widgets/payment/pay_form/stripe_pay_form.dart';

class PayForm extends StatelessWidget {
  final PaymentDetails paymentDetails;
  final String probiusId;
  const PayForm({required this.paymentDetails, required this.probiusId});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SelectPaymentMethod(paymentDetails: paymentDetails),
            //paymentDetails.isTotalPriceZero
            //? const SizedBox.shrink()
            //: SelectPaymentMethod(paymentDetails: paymentDetails),
            //paymentDetails.isTotalPriceZero
            //? const Text('Not ready for payment.')
            //: const SizedBox.shrink(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: paymentDetails.isAgreementAccepted,
                    onChanged: (bool? newValue) {
                      paymentDetails.isAgreementAccepted =
                          !paymentDetails.isAgreementAccepted;
                    },
                  ),
                  const Expanded(
                    child: AcceptTermsButton(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            FunctionCard(
              text: 'Go to checkout',
              onTap: paymentDetails.isReadyForCheckout
                  ? () {
                      context.goNamed(
                        Routes.paymentCheckoutConfirm,
                        params:
                            Args(probiusId: paymentDetails.probiusId).asMap(),
                        extra: paymentDetails,
                      );
                    }
                  : null,
            ),
          ]),
    );
  }
}

class SelectFormButton extends StatelessWidget {
  const SelectFormButton(this.text, {required this.selected});
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    Color bottomColor =
        this.selected ? Colors.yellow.shade700 : Colors.grey.shade400;

    return Container(
      width: 200,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 8.0, color: bottomColor),
        ),
      ),
      child: Text(this.text,
          textAlign: TextAlign.center, style: const TextStyle(fontSize: 30)),
    );
  }
}

class SelectPaymentMethod extends StatelessWidget {
  const SelectPaymentMethod({required this.paymentDetails});
  final PaymentDetails paymentDetails;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              key: const Key(XKeys.authFormRegisterTabButton),
              onTap: paymentDetails.isStripe
                  ? null
                  : () {
                      paymentDetails.platform = PaymentPlatform.stripe;
                    },
              child:
                  SelectFormButton('Card', selected: paymentDetails.isStripe),
            ),
            const SizedBox(width: 2),
            InkWell(
              key: const Key(XKeys.authFormSignInTabButton),
              onTap: paymentDetails.isBtcpay
                  ? null
                  : () {
                      paymentDetails.platform = PaymentPlatform.btcpay;
                    },
              child:
                  SelectFormButton('Crypto', selected: paymentDetails.isBtcpay),
            ),
          ],
        ),

        const SizedBox(height: 20),
        //

        paymentDetails.platform == PaymentPlatform.btcpay
            //? CryptoPayForm(paymentDetails: paymentDetails)
            ? CryptoPayFormUnavailable()
            : StripePayForm(paymentDetails: paymentDetails),
      ]),
    );
  }
}
