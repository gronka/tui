import 'package:tui_lib/tui_lib.dart';

class SurferEmailConfirmLinkPage extends StatefulWidget {
  const SurferEmailConfirmLinkPage({required this.token});
  final String token;

  @override
  SurferEmailConfirmLinkPageState createState() =>
      SurferEmailConfirmLinkPageState();
}

class SurferEmailConfirmLinkPageState
    extends State<SurferEmailConfirmLinkPage> {
  bool _showFailure = false;
  bool _showSuccess = false;
  bool _requestInProgress = true;

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200), () {
      _sendConfirmation();
    });
  }

  _sendConfirmation() async {
    ApiResponse ares = await King.of(context).lip.api(
      EndpointsV2.surferEmailVerify,
      payload: {'Token': widget.token},
    );

    if (ares.isOk) {
      setState(() {
        _requestInProgress = false;
        _showSuccess = true;
      });
    } else {
      setState(() {
        _requestInProgress = false;
        _showFailure = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: _requestInProgress
          ? ProgressIndicatorDrip()
          : Column(children: <Widget>[
              _showFailure
                  ? const Text18('Email verification failed.')
                  : const SizedBox.shrink(),
              _showSuccess
                  ? const Text18('Email verified. You may now log in.')
                  : const SizedBox.shrink(),
            ]),
    );
  }
}
