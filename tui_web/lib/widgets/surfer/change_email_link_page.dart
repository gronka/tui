import 'package:tui_lib/tui_lib.dart';

class SurferChangeEmailLinkPage extends StatefulWidget {
  const SurferChangeEmailLinkPage({required this.token});
  final String token;

  @override
  SurferChangeEmailLinkPageState createState() =>
      SurferChangeEmailLinkPageState();
}

class SurferChangeEmailLinkPageState extends State<SurferChangeEmailLinkPage> {
  bool _canSave = false;
  String _currentValue = '';
  String _failureMsg = '';
  final int _maxLength = ValidateSurfer.emailMaxLength;
  String _successMsg = '';
  bool _requestInProgress = false;
  final reqchange = RequestChange();

  @override
  initState() {
    super.initState();

    reqchange.loadFromApi(
      context: context,
      endpoint: EndpointsV2.surferChangeEmailRequestValidate,
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
                    ? Text18(_successMsg, maxLines: 4)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          //

                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            enabled: !_requestInProgress,
                            initialValue: '',
                            keyboardType: TextInputType.multiline,
                            maxLength: _maxLength,
                            style: Theme.of(context).textTheme.titleLarge,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Email',
                              counterText:
                                  '${_currentValue.length}/$_maxLength',
                            ),
                            onChanged: (newValue) {
                              _currentValue = newValue;
                              if (ValidateSurfer.email(_currentValue).isValid) {
                                setState(() {
                                  _canSave = true;
                                });
                              } else {
                                setState(() {
                                  _canSave = false;
                                });
                              }
                            },
                            validator: (value) {
                              return ValidateSurfer.email(_currentValue)
                                  .asValidator;
                            },
                          ),

                          const SizedBox(height: 12),
                          Text('Change your email', style: optionInfoStyle()),
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
        EndpointsV2.surferChangeEmail,
        payload: {
          'Email': _currentValue,
          'Token': widget.token,
        },
      );

      this.setState(() {
        _requestInProgress = false;
      });
      if (ares.isOk) {
        this.setState(() {
          _successMsg =
              'To finish changing your e-mail address, please check your inbox for a verification link.';
        });
      } else {
        this.setState(() {
          _failureMsg = 'Failed to submit new e-mail.';
        });
      }
    }
  }
}
