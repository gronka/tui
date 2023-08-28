import 'package:tui_lib/tui_lib.dart';

class SurferChangePasswordRequestPage extends StatefulWidget {
  const SurferChangePasswordRequestPage({required this.surferId});
  final String surferId;

  @override
  SurferChangePasswordRequestPageState createState() =>
      SurferChangePasswordRequestPageState();
}

class SurferChangePasswordRequestPageState
    extends State<SurferChangePasswordRequestPage> {
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
                'To initiate an password change, click the link below. You will be emailed a link which will allow you to change your password.',
                maxLines: 4,
              ),
              FunctionCard(
                text: 'Change my password',
                onTap: () {
                  _onSubmit(context);
                },
              ),

              const SizedBox(height: 12),
              FailureMsg(_msg),
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
        EndpointsV2.surferChangePasswordRequest,
        payload: {
          'Email': widget.surferId,
        },
      );

      this.setState(() {
        _requestInProgress = false;
      });
      if (ares.isOk) {
        this.setState(() {
          _msg = 'Email sent.';
        });
      } else {
        this.setState(() {
          _msg = 'Failed to submit change.';
        });
      }
    }
  }
}
