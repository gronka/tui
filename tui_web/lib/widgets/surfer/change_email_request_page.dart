import 'package:tui_lib/tui_lib.dart';

class SurferChangeEmailRequestPage extends StatefulWidget {
  const SurferChangeEmailRequestPage({required this.surferId});
  final String surferId;

  @override
  SurferChangeEmailRequestPageState createState() =>
      SurferChangeEmailRequestPageState();
}

class SurferChangeEmailRequestPageState
    extends State<SurferChangeEmailRequestPage> {
  String _msg = '';
  bool _requestInProgress = false;

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //
              const Text18(
                  'To initiate an email change, click the link below. You will be emailed a link which will allow you to change your email.',
                  maxLines: 4),
              FunctionCard(
                text: 'Change my email',
                onTap: () {
                  _onSubmit(context);
                },
              ),

              const SizedBox(height: 12),
              _msg == ''
                  ? const SizedBox.shrink()
                  : Text(_msg, style: failureStyle()),
            ],
          ),
        ),
      ),
    );
  }

  _onSubmit(BuildContext context) async {
    if (!_requestInProgress) {
      this.setState(() {
        _msg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await King.of(context).lip.api(
        EndpointsV2.surferChangeEmailRequest,
        payload: {
          'SurferId': widget.surferId,
        },
      );

      this.setState(() {
        _requestInProgress = false;
        this.setState(() {
          _msg = 'Email sent.';
        });
      });
      if (ares.isOk) {
      } else {
        this.setState(() {
          _msg = 'Failed to submit change.';
        });
      }
    }
  }
}
