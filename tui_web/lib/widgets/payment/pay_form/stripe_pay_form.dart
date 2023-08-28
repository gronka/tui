import 'package:tui_lib/tui_lib.dart';

class StripePayForm extends StatefulWidget {
  final PaymentDetails paymentDetails;
  const StripePayForm({required this.paymentDetails});

  @override
  StripePayFormState createState() => StripePayFormState();
}

class StripePayFormState extends State<StripePayForm> {
  bool _initialLoad = true;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      var plastics = PlasticProxy.of(context).allPlastics;

      PlasticProxy.of(context)
          .fetchAllPlastics(probiusId: widget.paymentDetails.probiusId)
          .then((_) {
        if (_initialLoad) {
          _initialLoad = false;
          if (plastics.isEmpty) {
            widget.paymentDetails.setPlasticId('unlisted');
          } else {
            widget.paymentDetails
                .setPlasticId(PlasticProxy.of(context).defaultPlasticId);
          }
        }
      });

      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 12),
            SizedBox(
              width: 500,
              child: Observer(builder: (_) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: plastics.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    Plastic plastic = plastics[index];

                    return Row(children: <Widget>[
                      Radio<String>(
                        value: plastic.plasticId,
                        groupValue: widget.paymentDetails.plasticId,
                        onChanged: (String? value) {
                          widget.paymentDetails.setPlasticId(value);
                          widget.paymentDetails.isAutopaySelected = true;
                        },
                      ),
                      PlasticSlab(plastic: plastic),
                    ]);
                  },
                );
              }),
            ),
            //

            Row(children: <Widget>[
              Radio<String>(
                value: 'unlisted',
                groupValue: widget.paymentDetails.plasticId,
                onChanged: (String? value) {
                  widget.paymentDetails.setPlasticId(value);
                },
              ),
              plastics.isEmpty
                  ? const TextCard('Add a card')
                  : const TextCard('Pay with another card'),
            ]),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: widget.paymentDetails.isAutopaySelected,
                    onChanged: (bool? newValue) {
                      widget.paymentDetails.isAutopaySelected =
                          !widget.paymentDetails.isAutopaySelected;
                      if (widget.paymentDetails.isAutopaySelected) {
                        widget.paymentDetails.isSaveCardSelected = true;
                      }
                    },
                  ),
                  const Expanded(
                      child: Text('Use this card for automatic payments')),
                ],
              ),
            ),
            //

            widget.paymentDetails.isPlasticIdUnlisted
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: widget.paymentDetails.isSaveCardSelected,
                          onChanged: widget.paymentDetails.isAutopaySelected
                              ? null
                              : (bool? newValue) {
                                  widget.paymentDetails.isSaveCardSelected =
                                      !widget.paymentDetails.isSaveCardSelected;
                                  if (!widget
                                      .paymentDetails.isSaveCardSelected) {
                                    widget.paymentDetails.isAutopaySelected =
                                        false;
                                  }
                                },
                        ),
                        const Expanded(child: Text('Save this card')),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ]);
    });
  }
}
