import 'package:tui_lib/tui_lib.dart';

class LoggedOutChangePasswordRequestPage extends StatefulWidget {
  @override
  LoggedOutChangePasswordRequestPageState createState() =>
      LoggedOutChangePasswordRequestPageState();
}

class LoggedOutChangePasswordRequestPageState
    extends State<LoggedOutChangePasswordRequestPage> {
  String _email = '';
  String _failureMsg = '';
  final _formKey = GlobalKey<FormState>();
  bool _requestInProgress = false;
  bool _submitFailed = false;
  bool _showEmailSent = false;

  String validateEmail(String email) {
    if (email != '') {
      if (email.length < 5) {
        return 'Email is too short';
      }
      int atPosition = email.indexOf('@');
      int dotPosition = email.lastIndexOf('.');
      if (dotPosition == -1 || atPosition == -1 || dotPosition <= atPosition) {
        return 'Email format is invalid';
      }
    }
    if (email == '') {
      return 'You must provide an email.';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: Container(
        width: 400,
        color: Colors.grey[150],
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                const Text16(
                    'We will email you a link to begin the password reset process.'),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: const Key(XKeys.authFormEmailField),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  maxLength: 320,
                  autocorrect: false,
                  onChanged: (value) {
                    if (this._submitFailed) {
                      setState(() {
                        this._submitFailed = false;
                        _failureMsg = '';
                      });
                    }
                    _email = value.trim();
                  },
                  validator: (value) {
                    String? error = validateEmail(value ?? '');
                    return error == '' ? null : error;
                  },
                ),
                const SizedBox(height: 14),
                //

                _requestInProgress
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        key: const Key(XKeys.authFormRegisterOrSignInButton),
                        onPressed: () => _onSubmit(context),
                        child: const Text('Reset Password'),
                      ),
                const SizedBox(height: 32),

                _showEmailSent
                    ? Text16(
                        'An email has been sent to $_email with further instructions.')
                    : const SizedBox.shrink(),
                _showEmailSent
                    ? const SizedBox(height: 32)
                    : const SizedBox.shrink(),

                _failureMsg == ''
                    ? const SizedBox.shrink()
                    : Text(_failureMsg, style: Bast.failure),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit(BuildContext context) async {
    setState(() {
      _requestInProgress = true;
    });

    ApiResponse ares = ApiResponse();
    if (_formKey.currentState?.validate() ?? false) {
      ares = await King.of(context).lip.api(
        EndpointsV2.surferChangePasswordRequest,
        payload: {
          'Email': _email,
        },
      );
    }

    this.setState(() {
      _requestInProgress = false;
    });

    if (ares.isOk) {
      this.setState(() {
        _failureMsg = '';
        _showEmailSent = true;
      });
    } else {
      if (ares.hasErrorCode('account_not_found')) {
        this.setState(() {
          _failureMsg = 'Account not found.';
        });
      } else {
        this.setState(() {
          _failureMsg = 'Failed to initiate password reset.';
          _showEmailSent = false;
        });
      }
    }
  }
}
