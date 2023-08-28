import 'package:tui_lib/tui_lib.dart';

class ConfirmEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const WebScaffold(
      body: Text22(
          'Please check your email for a confirmation link. Don\'t forget to check your spam.',
          maxLines: 4),
    );
  }
}
