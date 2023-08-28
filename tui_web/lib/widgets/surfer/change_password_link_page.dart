import 'package:tui_lib/tui_lib.dart';

class SurferChangePasswordLinkPage extends StatefulWidget {
  const SurferChangePasswordLinkPage({required this.token});
  final String token;

  @override
  SurferChangePasswordLinkPageState createState() =>
      SurferChangePasswordLinkPageState();
}

class SurferChangePasswordLinkPageState
    extends State<SurferChangePasswordLinkPage> {
  bool _canSave = false;
  String _currentValue = '';
  String _failureMsg = '';
  String _successMsg = '';
  bool _requestInProgress = false;
  final reqchange = RequestChange();

  @override
  initState() {
    super.initState();

    reqchange.loadFromApi(
      context: context,
      endpoint: EndpointsV2.surferChangePasswordRequestValidate,
      token: widget.token,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Observer(builder: (_) {
            return reqchange.isExpiredOrConsumed
                ? const Text18('This token has expired.')
                : _successMsg != ''
                    ? Text18(_successMsg)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          //
                          BasedCreatePassword(
                            textFieldKey: const Key('passwordChangeField'),
                            onChanged: (password) {
                              _currentValue = password;
                              if (ValidateSurfer.password(_currentValue)
                                  .isValid) {
                                setState(() {
                                  _canSave = true;
                                });
                              } else {
                                setState(() {
                                  _canSave = false;
                                });
                              }
                            },
                          ),

                          const SizedBox(height: 12),
                          Text('Change your password',
                              style: optionInfoStyle()),
                          const SizedBox(height: 12),
                          _requestInProgress
                              ? LoadingWidget()
                              : SizedBox(
                                  height: 50,
                                  width: 60,
                                  child: ElevatedButton(
                                    onPressed: _canSave
                                        ? () {
                                            FocusScope.of(context).unfocus();
                                            _onSubmit(context);
                                          }
                                        : null,
                                    child: const Text18('Save'),
                                  ),
                                ),
                          const SizedBox(height: 12),
                          _failureMsg == ''
                              ? const SizedBox.shrink()
                              : Text(_failureMsg, style: failureStyle()),
                        ],
                      );
          }),
        ),
      ),
    );
  }

  _onSubmit(BuildContext context) async {
    if (!_requestInProgress) {
      this.setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await King.of(context).lip.api(
        EndpointsV2.surferChangePassword,
        payload: {
          'Password': _currentValue,
          'Token': widget.token,
        },
      );

      this.setState(() {
        _requestInProgress = false;
      });
      if (ares.isOk) {
        this.setState(() {
          _successMsg = 'Password changed.';
        });
      } else {
        this.setState(() {
          _failureMsg = 'Failed to submit change.';
        });
      }
    }
  }
}
