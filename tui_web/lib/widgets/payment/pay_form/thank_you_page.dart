import 'package:tui_lib/tui_lib.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({required this.probiusId});
  final String probiusId;

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: Column(children: <Widget>[
        const BaText('Your payment was successsful.'),
        const SizedBox(height: 20),
        FunctionCard(
          text: 'Return to home',
          onTap: () {
            ProbiusProxy.of(context).getById(probiusId, forceApi: true);
            context.go(Routes.home);
          },
        ),
      ]),
    );
  }
}
