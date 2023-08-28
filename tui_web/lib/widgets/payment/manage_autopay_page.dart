import 'package:url_launcher/url_launcher.dart';
import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

class ManageAutopayPage extends StatefulWidget {
  final String probiusId;
  const ManageAutopayPage({required this.probiusId});

  @override
  ManageAutopayPageState createState() => ManageAutopayPageState();
}

class ManageAutopayPageState extends State<ManageAutopayPage> {
  String _failureMsg = '';
  bool _initialLoad = true;
  bool _isAgreementAccepted = false;
  bool _requestInProgress = false;
  String _selectedPlasticId = '';

  @override
  initState() {
    super.initState();
  }

  bool _canSave(Probius probius) {
    return _selectedPlasticId.isNotEmpty &&
        _isAgreementAccepted &&
        _selectedPlasticId != probius.defaultPlasticId;
  }

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: Observer(builder: (_) {
        final probius = ProbiusProxy.of(context).getById(widget.probiusId);

        PlasticProxy.of(context)
            .fetchAllPlastics(probiusId: widget.probiusId, forceApi: true)
            .then((_) {
          if (_initialLoad) {
            _initialLoad = false;
            _selectedPlasticId = probius.defaultPlasticId;
          }
        });

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 24),
              const Text20('Autopay'),
              const SizedBox(height: 24),
              const Text18('Current card used for autopayment:'),
              const SizedBox(height: 24),

              Observer(builder: (_) {
                return probius.defaultPlasticId.isEmpty
                    ? const Text18('No card selected for autopay.')
                    : SizedBox(
                        width: 500,
                        child: Observer(builder: (_) {
                          return PlasticSlab(
                              plastic: PlasticProxy.of(context).defaultPlastic);
                        }),
                      );
              }),
              const SizedBox(height: 24),

              const Text18(
                  'Select a card below to change your autopay method.'),
              const SizedBox(height: 20),

              FunctionCard(
                text: 'Add a card',
                onTap: () {
                  _onAddCard(context, widget.probiusId);
                },
              ),
              const SizedBox(height: 20),
              //

              _step2(probius),
            ]);
      }),
    );
  }

  Widget _step2(Probius probius) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 500,
          child: Observer(builder: (_) {
            ObservableList plastics = PlasticProxy.of(context).allPlastics;

            return ListView.separated(
              shrinkWrap: true,
              itemCount: plastics.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                Plastic plastic = plastics[index];

                return Row(children: <Widget>[
                  Radio<String>(
                    value: plastic.plasticId,
                    groupValue: _selectedPlasticId,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPlasticId = plastic.plasticId;
                      });
                    },
                  ),
                  PlasticSlab(plastic: plastic),
                ]);
              },
            );
          }),
        ),
        const SizedBox(height: 12),
        //

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: _isAgreementAccepted,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isAgreementAccepted = !_isAgreementAccepted;
                  });
                },
              ),
              const Expanded(child: AcceptTermsButton()),
            ],
          ),
        ),
        const SizedBox(height: 12),

        FunctionCard(
          text: 'Use this card for autopay',
          onTap: _canSave(probius)
              ? () {
                  _onSubmit(
                      context, probius.probiusId, probius.defaultPlasticId);
                }
              : null,
        ),
        const SizedBox(height: 12),

        FunctionCard(
          text: 'Delete this card',
          onTap: _selectedPlasticId.isNotEmpty
              ? () {
                  _showDeleteCardModal(context, probius.probiusId);
                }
              : null,
        ),
        const SizedBox(height: 12),

        Observer(
          builder: (_) => Container(
            color: probius.isAutopayEnabled ? Colors.green : Colors.red,
            child: SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: probius.isAutopayEnabled
                    ? Row(children: <Widget>[
                        const Text18('Autopay is enabled'),
                        const SizedBox(width: 20),
                        FunctionCard(
                          text: 'Disable autopay',
                          onTap: () {
                            _submitToggleAutopay(
                                context, probius.probiusId, false);
                          },
                        ),
                      ])
                    : Row(children: <Widget>[
                        const Text18('Autopay is disabled'),
                        const SizedBox(width: 20),
                        FunctionCard(
                          text: 'Enable autopay',
                          onTap: () {
                            _submitToggleAutopay(
                                context, probius.probiusId, true);
                          },
                        ),
                      ]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

        _failureMsg.isEmpty
            ? const SizedBox.shrink()
            : Text(_failureMsg, style: Bast.failure),
      ],
    );
  }

  void _showDeleteCardModal(BuildContext context, String probiusId) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          width: 400,
          color: Colors.amber,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Are you sure you want to delete this card?'),
                  const SizedBox(height: 12),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            child: const Text('Yes'),
                            onPressed: () async {
                              await _onDeleteCard(context, probiusId);
                              if (!mounted) return;
                              context.pop();
                            }),
                        const SizedBox(width: 60),
                        ElevatedButton(
                          child: const Text('No'),
                          onPressed: () => context.pop(),
                        ),
                      ]),
                ]),
          ),
        );
      },
    );
  }

  _onAddCard(BuildContext context, String probiusId) async {
    if (!_requestInProgress) {
      final king = King.of(context);
      setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await King.of(context).lip.api(
        EndpointsV2.probiusPlasticAdd,
        payload: {
          'ProbiusId': probiusId,
        },
      );

      setState(() {
        _requestInProgress = false;
      });
      if (ares.isOk) {
        String stripeUrl = ares.body['StripeUrl'];
        if (!await launchUrl(Uri.parse(stripeUrl))) {
          if (!mounted) return;
          king.snacker.addSnack(Snacks.stripeLaunchError);
          ProbiusProxy.of(context).getById(probiusId, forceApi: true);
          PlasticProxy.of(context)
              .fetchAllPlastics(probiusId: probiusId, forceApi: true);
        } else {
          if (!mounted) return;
          context.pop();
          ProbiusProxy.of(context).getById(probiusId, forceApi: true);
          PlasticProxy.of(context)
              .fetchAllPlastics(probiusId: probiusId, forceApi: true);
        }
      } else {
        setState(() {
          _failureMsg =
              ares.peekErrorMsg(defaultText: 'Failed to submit change.');
        });
      }
    }
  }

  _onDeleteCard(BuildContext context, String probiusId) async {
    if (!_requestInProgress) {
      setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await King.of(context).lip.api(
        EndpointsV2.probiusPlasticDelete,
        payload: {
          'PlasticId': _selectedPlasticId,
          'ProbiusId': probiusId,
        },
      );

      setState(() {
        _requestInProgress = false;
      });
      if (ares.isOk) {
        if (!mounted) return;
        PlasticProxy.of(context)
            .fetchAllPlastics(probiusId: probiusId, forceApi: true);
        ProbiusProxy.of(context).getById(probiusId, forceApi: true);
      } else {
        setState(() {
          _failureMsg =
              ares.peekErrorMsg(defaultText: 'Failed to submit change.');
        });
      }
    }
  }

  _onSubmit(
      BuildContext context, String probiusId, String defaultPlasticId) async {
    final king = King.of(context);
    if (!_requestInProgress) {
      if (_selectedPlasticId == defaultPlasticId) {
        context.pop();
      }

      setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await king.lip.api(
        EndpointsV2.probiusChangeDefaultPlasticId,
        payload: {
          'DefaultPlasticId': _selectedPlasticId,
          'ProbiusId': probiusId,
          'TermsAcceptedVersion': _isAgreementAccepted ? '1.0' : '',
        },
      );

      setState(() {
        _requestInProgress = false;
      });
      if (ares.isOk) {
        if (!mounted) return;
        PlasticProxy.of(context)
            .fetchAllPlastics(probiusId: probiusId, forceApi: true);
        ProbiusProxy.of(context).getById(probiusId, forceApi: true);
        context.pop();
      } else {
        setState(() {
          _failureMsg =
              ares.peekErrorMsg(defaultText: 'Failed to submit change.');
        });
      }
    }
  }

  _submitToggleAutopay(
      BuildContext context, String probiusId, bool enableAutopay) async {
    if (!_requestInProgress) {
      setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await King.of(context).lip.api(
        EndpointsV2.probiusToggleAutopay,
        payload: {
          'EnableAutopay': enableAutopay,
          'ProbiusId': probiusId,
        },
      );

      setState(() {
        _requestInProgress = false;
      });
      if (ares.isOk) {
        if (!mounted) return;
        ProbiusProxy.of(context).getById(probiusId, forceApi: true);
      } else {
        setState(() {
          _failureMsg =
              ares.peekErrorMsg(defaultText: 'Failed to submit change.');
        });
      }
    }
  }
}
