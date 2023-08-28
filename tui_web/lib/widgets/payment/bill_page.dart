import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

class BillPage extends StatefulWidget {
  final String billId;
  final String probiusId;
  const BillPage({required this.billId, required this.probiusId});

  @override
  BillPageState createState() => BillPageState();
}

class BillPageState extends State<BillPage> {
  bool _shouldLoad = false;

  @override
  Widget build(BuildContext context) {
    final probius = ProbiusProxy.of(context).getById(widget.probiusId);
    final project = ProjectProxy.of(context).getById(probius.projectId);
    final bill = BillProxy.of(context).getById(widget.billId);

    return WebScaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Observer(builder: (_) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text18('Project: ${project.name}'),
                        const SizedBox(height: 8),

                        Text18('Bill for period ${periodToHuman(bill.period)}'),
                        const SizedBox(height: 12),

                        SimpleRow(left: 'Total Price', right: bill.price.toUsd),
                        const SizedBox(height: 8),

                        SimpleRow(left: 'Total Price', right: bill.price.toUsd),
                        const SizedBox(height: 8),
                        //

                        SimpleRow(
                            left: 'Credit Applied',
                            right: bill.creditApplied.toUsd),
                        const SizedBox(height: 8),

                        SimpleRow(left: 'Status', right: bill.status),
                        const SizedBox(height: 16),

                        SimpleRow(
                            left: 'Is autopayment enabled?',
                            right: probius.isAutopayEnabled ? 'Yes' : 'No'),
                        const SizedBox(height: 12),

                        const Text18(
                            'If autopayment is enabled or if there is enough credit on your account, then your bill will be paid automatically on the 7th of each month. If payment fails, you can pay your bill here.'),

                        const SizedBox(height: 12),
                        bill.needsPayment
                            ? FunctionCard(
                                text: 'Pay now',
                                onTap: () {
                                  context.goNamed(
                                    Routes.billPayNow,
                                    params: Args(
                                            billId: widget.billId,
                                            probiusId: widget.probiusId)
                                        .asMap(),
                                  );
                                })
                            : const SizedBox.shrink(),
                        const SizedBox(height: 16),

                        const Text18('Charges:'),
                      ]);
                }),
                Observer(builder: (_) {
                  ObservableList chargeIdList =
                      Lad.of(context).chargeIdListByBillIdCache.apiGetById(
                            id: bill.billId,
                            forceApi: _shouldLoad,
                            collectionCache: Lad.of(context).propertyCache,
                          );
                  _shouldLoad = false;

                  List<Charge> charges = Lad.of(context)
                      .chargeCache
                      .getItemsAsList(List.from(chargeIdList));

                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: charges.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      var charge = charges[index];

                      return ChargeCard(
                        charge: charge,
                        index: index,
                        project: project,
                      );
                    },
                  );
                }),
                const SizedBox(height: 24),
              ]),
        ),
      ),
    );
  }
}

class ChargeCard extends StatelessWidget {
  const ChargeCard({
    required this.charge,
    required this.index,
    required this.project,
  });
  final int index;
  final Charge charge;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text18('${index + 1}. ${charge.title}'),
                const SizedBox(height: 4),
                Text18('Price: ${charge.price.toUsd}'),
                const SizedBox(height: 4),
                SelectableText('Charge ID: ${charge.chargeId}'),
                const SizedBox(height: 4),
                SelectableText('Description: ${charge.description}'),
                const SizedBox(height: 4),
                SelectableText('Meta: ${charge.meta}'),
                const SizedBox(height: 4),
              ]),
        ),
      ),
    );
  }
}
