import 'package:tui_lib/tui_lib.dart';

class SurferSetFirstNamePage extends StatefulWidget {
  final String surferId;
  const SurferSetFirstNamePage({required this.surferId});

  @override
  SurferSetFirstNamePageState createState() => SurferSetFirstNamePageState();
}

class SurferSetFirstNamePageState extends State<SurferSetFirstNamePage> {
  bool _canSave = false;
  String _currentValue = '';
  bool _initialLoad = true;
  String _failureMsg = '';
  final _maxLength = ValidateSurfer.firstNameMaxLength;
  bool _requestInProgress = false;
  final _controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Observer(
            builder: (_) {
              var surfer = SurferProxy.of(context).getById(widget.surferId);
              if (surfer.isLoaded && _initialLoad) {
                _initialLoad = false;
                _controller.text = surfer.firstName;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //
                  Text20('Your first name is currently ${surfer.firstName}'),
                  const SizedBox(height: 20),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _controller,
                    enabled: !_requestInProgress,
                    keyboardType: TextInputType.multiline,
                    maxLength: _maxLength,
                    style: Theme.of(context).textTheme.titleLarge,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'First name',
                      counterText: '${_currentValue.length}/$_maxLength',
                    ),
                    onChanged: (newValue) {
                      _currentValue = newValue;
                      if (ValidateSurfer.firstName(_currentValue).isValid) {
                        setState(() {
                          _canSave = true;
                        });
                      } else {
                        setState(() {
                          _canSave = false;
                        });
                      }
                    },
                    //

                    validator: (value) {
                      return ValidateSurfer.firstName(_currentValue)
                          .asValidator;
                    },
                  ),

                  _requestInProgress
                      ? ProgressIndicatorDrip()
                      : IconButton(
                          icon: Icon(Icons.check,
                              color: _canSave ? Colors.green : Colors.black),
                          onPressed: _requestInProgress
                              ? null
                              : () {
                                  if (_canSave) {
                                    FocusScope.of(context).unfocus();
                                    _onSubmit(context);
                                  }
                                },
                        ),

                  const SizedBox(height: 12),
                  FailureMsg(_failureMsg),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _onSubmit(BuildContext context) async {
    if (!_requestInProgress) {
      setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await King.of(context).lip.api(
        EndpointsV2.surferSetFirstName,
        payload: {
          'FirstName': _currentValue,
          'SurferId': King.of(context).todd.surferId,
        },
      );

      setState(() {
        _requestInProgress = false;
      });

      if (ares.isOk) {
        if (!mounted) return;
        SurferProxy.of(context).getById(widget.surferId, forceApi: true);

        context.goNamed(
          Routes.surfer,
          params: Args(surferId: widget.surferId).asMap(),
        );
      } else {
        setState(() {
          _failureMsg = 'Failed to set first name.';
        });
      }
    }
  }
}
