import 'package:tui_lib/tui_lib.dart';

class CryptoPayFormUnavailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(10.0),
      child: const Text18(
        'Email us if you want to enable crypto payments.',
        maxLines: 5,
      ),
    );
  }
}

class CryptoPayForm extends StatefulWidget {
  const CryptoPayForm({required this.paymentDetails});
  final PaymentDetails paymentDetails;

  @override
  CryptoPayFormState createState() => CryptoPayFormState();
}

class CryptoPayFormState extends State<CryptoPayForm> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              itemCount: Coin.values.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                var coin = Coin.values[index];

                return Observer(
                  builder: (_) => RadioListTile<Coin>(
                    title: Text(coin.title),
                    value: coin,
                    groupValue: widget.paymentDetails.coin,
                    onChanged: (Coin? value) {
                      widget.paymentDetails.coin = value;
                    },
                  ),
                );
              },
            ),
          ]),
    );
  }
}
