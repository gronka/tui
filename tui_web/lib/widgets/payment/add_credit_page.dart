import 'package:flutter/services.dart';

import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/payment/pay_form/pay_form.dart';

class AddCreditPage extends StatefulWidget {
  final String probiusId;
  const AddCreditPage({required this.probiusId});

  @override
  AddCreditPageState createState() => AddCreditPageState();
}

class AddCreditPageState extends State<AddCreditPage> {
  PaymentDetails paymentDetails = PaymentDetails();
  late FocusNode _amountFocusNode;
  String _failureMsg = '';
  bool _is20 = false;
  bool _is50 = false;
  bool _isCustom = false;
  double _price = 0;

  @override
  initState() {
    super.initState();
    paymentDetails.silo = PaymentSilo.addCredit;
    paymentDetails.probiusId = widget.probiusId;

    _amountFocusNode = FocusNode();
  }

  void _set20() {
    setState(() {
      _is20 = true;
      _is50 = false;
      _isCustom = false;
    });
    paymentDetails.overrideTotal = 2000;
  }

  void _set50() {
    setState(() {
      _is20 = false;
      _is50 = true;
      _isCustom = false;
    });
    paymentDetails.overrideTotal = 5000;
  }

  void _setCustom() {
    setState(() {
      _is20 = false;
      _is50 = false;
      _isCustom = true;
    });
    paymentDetails.setOverrideTotalWithDouble(_price);
    _amountFocusNode.requestFocus();
  }

  void _setPrice(String value) {
    double asDouble = 0;
    try {
      asDouble = double.parse(value);
    } catch (_) {
      setState(() {
        _failureMsg = 'Invalid number';
      });
      return;
    }

    if (asDouble < 5) {
      setState(() {
        _failureMsg = 'Minimum payment is \$5';
      });
      return;
    }

    setState(() {
      _price = asDouble;
      _failureMsg = '';
      paymentDetails.setOverrideTotalWithDouble(_price);
    });
  }

  String get _initialPrice {
    if (_price == 0) {
      return '';
    }
    return _price.toString();
  }

  @override
  Widget build(BuildContext context) {
    //var probius = ProbiusProxy.of(context).getById(widget.probiusId);
    return WebScaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const TextCard('Add credit to your account.'),
            //
            const TextCard('Previous Balance:'),

            const TextCard(
                'Select how much credit you want to add. Credit will be applied to you past balances immediately.'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: _is20,
                    onChanged: (bool? newValue) => _set20(),
                  ),
                  const Expanded(child: Text('\$20')),
                ],
              ),
            ),
            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 80,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: _is50,
                      onChanged: (bool? newValue) => _set50(),
                    ),
                    const Expanded(child: Text('\$50')),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 60,
                width: 260,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isCustom,
                      onChanged: (bool? newValue) => _setCustom(),
                    ),
                    const Text('Custom amount:'),
                    const SizedBox(width: 10),
                    _isCustom ? const Text20('\$') : const SizedBox.shrink(),
                    const SizedBox(width: 4),
                    Expanded(
                      child: !_isCustom
                          ? const SizedBox.shrink()
                          : TextFormField(
                              key: const Key(XKeys.ccFormExpirationFieldDd),
                              initialValue: _initialPrice,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                //labelText: 'Amount to pay',
                              ),
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]')),
                              ],
                              style: Theme.of(context).textTheme.titleLarge,
                              textInputAction: TextInputAction.next,
                              focusNode: _amountFocusNode,
                              textAlign: TextAlign.end,
                              onChanged: (value) {
                                _setPrice(value);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),

            FailureMsg(_failureMsg),
            const SizedBox(height: 20),
            //

            Observer(
                builder: (_) => PayForm(
                      paymentDetails: paymentDetails,
                      probiusId: widget.probiusId,
                    )),
          ]),
    );
  }
}
