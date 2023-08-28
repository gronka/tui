import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/console/console_wrapper.dart';

class PropertyCreatePage extends StatefulWidget {
  final Property property = Property();

  @override
  PropertyCreatePageState createState() => PropertyCreatePageState();
}

class PropertyCreatePageState extends State<PropertyCreatePage> {
  bool _canSave = false;
  String _failureMsg = '';
  late FocusNode _focusNode;
  bool _requestInProgress = false;
  bool _isSearching = false;

  bool _didUserInput = false;
  final String _country = 'United States';
  String _notes = '';
  String _selectedPlaceId = '';

  final TextEditingController _addressController =
      TextEditingController(text: '');
  final TextEditingController _cityController = TextEditingController(text: '');
  final TextEditingController _countyController =
      TextEditingController(text: '');
  final TextEditingController _postalController =
      TextEditingController(text: '');
  final TextEditingController _stateController =
      TextEditingController(text: '');
  final TextEditingController _street1Controller =
      TextEditingController(text: '');
  final TextEditingController _street2Controller =
      TextEditingController(text: '');

  String get _address {
    return _addressController.text;
  }

  set _address(String value) {
    _addressController.text = value;
  }

  String get _city {
    return _cityController.text;
  }

  set _city(String value) {
    _cityController.text = value;
  }

  String get _county {
    return _countyController.text;
  }

  set _county(String value) {
    _countyController.text = value;
  }

  String get _postal {
    return _postalController.text;
  }

  set _postal(String value) {
    _postalController.text = value;
  }

  String get _state {
    return _stateController.text;
  }

  set _state(String value) {
    _stateController.text = value;
  }

  String get _street1 {
    return _street1Controller.text;
  }

  set _street1(String value) {
    _street1Controller.text = value;
  }

  String get _street2 {
    return _street2Controller.text;
  }

  set _street2(String value) {
    _street2Controller.text = value;
  }

  @override
  initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  @override
  dispose() {
    _focusNode.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _countyController.dispose();
    _postalController.dispose();
    _stateController.dispose();
    _street1Controller.dispose();
    _street2Controller.dispose();
    super.dispose();
  }

  void _onAnyChange() {
    print('88888888888888888888888888888888888');
    print(_address);
    print(_street1);
    print(_street2);
    print(_city);
    print(_country);
    print(_postal);
    print(_state);
    print(_notes);
    if (ValidateProperty.allFields(
      address: _address,
      city: _city,
      country: _country,
      postal: _postal,
      state: _state,
      street1: _street1,
      street2: _street2,
      notes: _notes,
    )) {
      setState(() {
        _canSave = true;
      });
    } else {
      setState(() {
        _canSave = false;
      });
    }
  }

  void _clearForm() {
    _selectedPlaceId = '';
    _address = '';
    _street1 = '';
    _street2 = '';
    _city = '';
    _county = '';
    _postal = '';
    _state = '';
    _notes = '';
  }

  @override
  Widget build(BuildContext context) {
    var predictions = ObservableList<PlacePrediction>();
    _didUserInput = _address != widget.property.address;
    if (_didUserInput) {
      predictions = King.of(context)
          .lad
          .placePredictionsProxy
          .getPredictions(input: _address);
    }

    return ConsoleWrapper(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _addressController,
            enabled: !_requestInProgress,
            focusNode: _focusNode,
            keyboardType: TextInputType.multiline,
            maxLength: ValidateProperty.addressMaxLength,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Property address',
              counterText:
                  '${_address.length}/${ValidateProperty.addressMaxLength}',
            ),
            onChanged: (newValue) {
              _selectedPlaceId = '';
              _onAnyChange();
            },
            validator: (value) {
              return ValidateProperty.address(_address).asValidator;
            },
          ),
          const SizedBox(height: 4),
          _didUserInput
              ? const SizedBox.shrink()
              : const Text('Search for an address above'),
          _buildPredictionList(context, predictions),
          const SizedBox(height: 32),
          //

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _street1Controller,
            //enabled: !_requestInProgress,
            enabled: false,
            keyboardType: TextInputType.multiline,
            maxLength: ValidateProperty.street1MaxLength,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Street Line 1',
              counterText:
                  '${_street1.length}/${ValidateProperty.street1MaxLength}',
            ),
            onChanged: (newValue) {
              _onAnyChange();
            },
            validator: (value) {
              return ValidateProperty.street1(_street1).asValidator;
            },
          ),
          //

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _street2Controller,
            //enabled: !_requestInProgress,
            enabled: false,
            keyboardType: TextInputType.multiline,
            maxLength: ValidateProperty.street2MaxLength,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Street Line 2',
              counterText:
                  '${_street2.length}/${ValidateProperty.street2MaxLength}',
            ),
            onChanged: (newValue) {
              _onAnyChange();
            },
            validator: (value) {
              return ValidateProperty.street2(_street2).asValidator;
            },
          ),
          //

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _postalController,
            //enabled: !_requestInProgress,
            enabled: false,
            keyboardType: TextInputType.multiline,
            maxLength: ValidateProperty.postalMaxLength,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Zip Code',
              counterText:
                  '${_postal.length}/${ValidateProperty.postalMaxLength}',
            ),
            onChanged: (newValue) {
              _onAnyChange();
            },
            validator: (value) {
              return ValidateProperty.postal(_postal).asValidator;
            },
          ),
          //

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityController,
            //enabled: !_requestInProgress,
            enabled: false,
            keyboardType: TextInputType.multiline,
            maxLength: ValidateProperty.cityMaxLength,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'City',
              counterText: '${_city.length}/${ValidateProperty.cityMaxLength}',
            ),
            onChanged: (newValue) {
              _onAnyChange();
            },
            validator: (value) {
              return ValidateProperty.city(_city).asValidator;
            },
          ),
          //

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _countyController,
            //enabled: !_requestInProgress,
            enabled: false,
            keyboardType: TextInputType.multiline,
            maxLength: ValidateProperty.countyMaxLength,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'County',
              counterText:
                  '${_county.length}/${ValidateProperty.countyMaxLength}',
            ),
            onChanged: (newValue) {
              _onAnyChange();
            },
            validator: (value) {
              return ValidateProperty.county(_county).asValidator;
            },
          ),
          //

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _stateController,
            //enabled: !_requestInProgress,
            enabled: false,
            keyboardType: TextInputType.multiline,
            maxLength: ValidateProperty.stateMaxLength,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'State',
              counterText:
                  '${_state.length}/${ValidateProperty.stateMaxLength}',
            ),
            onChanged: (newValue) {
              _onAnyChange();
            },
            validator: (value) {
              return ValidateProperty.state(_state).asValidator;
            },
          ),
          //

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: !_requestInProgress,
            keyboardType: TextInputType.multiline,
            maxLength: ValidateProperty.notesMaxLength,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Notes (for yourself, not us)',
              counterText:
                  '${_notes.length}/${ValidateProperty.notesMaxLength}',
            ),
            onChanged: (newValue) {
              _notes = newValue;
              _onAnyChange();
            },
            validator: (value) {
              return ValidateProperty.notes(_notes).asValidator;
            },
          ),
          //

          const SizedBox(height: 12),
          //

          FailureMsg(_failureMsg),
          const SizedBox(height: 20),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      context.go(Routes.properties);
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      _clearForm();
                    },
                    child: const Text('Reset Form')),
                TextButton(
                    onPressed: _canSave ? () => _onSubmit(context) : null,
                    child: const Text('Create')),
              ]),
        ],
      ),
    );
  }

  /// Builds the prediction list widget.
  ///
  /// NOTE: to avoid build artifacts, we build the query - 1 character because
  /// we assume this is the most common artifacting scenario.
  Widget _buildPredictionList(
    BuildContext context,
    ObservableList<PlacePrediction> predictions,
  ) {
    return Observer(builder: (BuildContext context) {
      if (predictions.isEmpty) {
        if (_address.length > 3) {
          if (_didUserInput) {
            _isSearching = true;
            predictions =
                King.of(context).lad.placePredictionsProxy.getPredictions(
                      input: _address.substring(0, _address.length - 1),
                    );

            Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                _isSearching = false;
              });
            });
          } else {
            predictions = ObservableList<PlacePrediction>();
          }
        }
      }
      return predictions.isNotEmpty
          ? ListView.builder(
              itemCount: predictions.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var prediction = predictions[index];

                bool enabled = prediction.placeId != _selectedPlaceId;
                return Card(
                  child: InkWell(
                    key: Key('predictionCardAddress:${prediction.address}'),
                    onTap: !enabled
                        ? null
                        : () {
                            setState(() {
                              _selectedPlaceId = prediction.placeId;
                              _getPlaceDetails(context, prediction);
                            });
                          },
                    child: ListTile(
                      enabled: enabled,
                      leading: const FlutterLogo(),
                      title: Text(
                        prediction.address,
                      ),
                    ),
                  ),
                );
              },
            )
          : _didUserInput && _isSearching
              ? const Text('Searching...')
              : const Text('No result found.');
    });
  }

  _getPlaceDetails(BuildContext context, PlacePrediction prediction) async {
    var king = King.of(context);
    if (!_requestInProgress) {
      setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await king.lip.api(
        EndpointsV2.placeGetByPlaceId,
        payload: {
          'PlaceId': prediction.placeId,
        },
      );

      setState(() {
        _requestInProgress = false;
      });

      if (ares.isOk) {
        if (!mounted) return;
        var place = Place.fromJson(ares.body);
        _addressController.text = place.address;
        _cityController.text = place.city;
        _countyController.text = place.county;
        _postalController.text = place.postal;
        _stateController.text = place.state;
        _street1Controller.text = place.street1;
        _street2Controller.text = place.street2;
        _onAnyChange();
      } else {
        setState(() {
          _failureMsg = ares.peekErrorMsg(
              defaultText: 'Error getting place information.');
        });
      }
    }
  }

  _onSubmit(BuildContext context) async {
    var king = King.of(context);
    if (!_requestInProgress) {
      setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await king.lip.api(
        EndpointsV2.propertyCreate,
        payload: {
          'Address': _address,
          'Street1': _street1,
          'Street2': _street2,
          'City': _city,
          'County': _county,
          'Country': _country,
          'Postal': _postal,
          'State': _state,
          'Notes': _notes,
          'SurferId': King.of(context).todd.surferId,
        },
      );

      setState(() {
        _requestInProgress = false;
      });

      if (ares.isOk) {
        if (!mounted) return;
        context.go(Routes.properties);
        _clearForm();
      } else {
        setState(() {
          _failureMsg =
              ares.peekErrorMsg(defaultText: 'Error creating property.');
        });
      }
    }
  }
}
