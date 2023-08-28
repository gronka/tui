import 'package:tui_lib/tui_lib.dart';

class SurferChangeEmailValidateNewLinkPage extends StatefulWidget {
  const SurferChangeEmailValidateNewLinkPage({required this.token});
  final String token;

  @override
  SurferChangeEmailValidateNewLinkPageState createState() =>
      SurferChangeEmailValidateNewLinkPageState();
}

class SurferChangeEmailValidateNewLinkPageState
    extends State<SurferChangeEmailValidateNewLinkPage> {
  bool _showFailure = false;
  bool _showSuccess = false;

  @override
  initState() {
    super.initState();
    _sendConfirmation();
  }

  _sendConfirmation() async {
    ApiResponse ares = await King.of(context).lip.api(
      EndpointsV2.surferChangeEmailValidateNewLink,
      payload: {'Token': widget.token},
    );

    if (ares.isOk) {
      setState(() {
        _showSuccess = true;
      });
    } else {
      setState(() {
        _showFailure = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: Column(children: <Widget>[
        _showFailure
            ? const Text18('Email change verification failed.')
            : const SizedBox.shrink(),
        _showSuccess
            ? const Text18('Email change verified. You may now log in.')
            : const SizedBox.shrink(),
      ]),
    );
  }
}
