import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/sign_in/types.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.whichForm);
  final AuthPages whichForm;

  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends State<AuthForm> {
  String _failureMsg = '';
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _submitFailed = false;
  AuthFormFields fields = AuthFormFields();

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
    return Container(
      width: 400,
      color: Colors.grey[150],
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Text(widget.whichForm.banner,
                  style: const TextStyle(fontSize: 16)),
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
                  fields.email = value.trim();
                },
                validator: (value) {
                  String? error = validateEmail(value ?? '');
                  return error == '' ? null : error;
                },
              ),
              const SizedBox(height: 14),
              BasedCreatePassword(
                textFieldKey: const Key(XKeys.authFormPasswordField),
                onChanged: (password) {
                  if (this._submitFailed) {
                    setState(() {
                      this._submitFailed = false;
                      _failureMsg = '';
                    });
                  }
                  fields.password = password;
                },
                onFieldSubmitted: () {
                  _onSubmit(context);
                },
              ),
              const SizedBox(height: 32),
              //

              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      key: const Key(XKeys.authFormRegisterOrSignInButton),
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        _onSubmit(context);
                      },
                      child: Text(widget.whichForm.buttonTitle),
                    ),
              const SizedBox(height: 32),

              widget.whichForm == AuthPages.register
                  ? const SizedBox.shrink()
                  : TextButton(
                      key: const Key(XKeys.authFormResetPasswordButton),
                      onPressed: () =>
                          context.go(Routes.loggedOutChangePasswordRequest),
                      child: const Text('Forgot password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          )),
                    ),
              const SizedBox(height: 24),

              FailureMsg(_failureMsg)
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    if (_formKey.currentState?.validate() ?? false) {
      var ares = await widget.whichForm.performAuth(context, fields);

      if (!mounted) return;
      _handleResponse(context, ares);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _handleResponse(BuildContext context, ApiResponse ares) {
    if (ares.isOk) {
      context.go(widget.whichForm.nextPage);
    } else {
      if (ares.hasErrorCode('email_not_verified')) {
        setState(() {
          _failureMsg = ares.peekErrorMsg(
              defaultText:
                  'You cannot sign in until clicking the email verification link we sent you. Check your spam');
          this._submitFailed = true;
        });
      } else {
        setState(() {
          _failureMsg =
              ares.peekErrorMsg(defaultText: widget.whichForm.failedMessage);
          this._submitFailed = true;
        });
      }
    }
  }
}
