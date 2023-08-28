import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

class ViewBillsPage extends StatefulWidget {
  const ViewBillsPage({required this.probiusId});
  final String probiusId;

  @override
  ViewBillsPageState createState() => ViewBillsPageState();
}

class ViewBillsPageState extends State<ViewBillsPage> {
  bool _forceLoad = true;

  @override
  Widget build(BuildContext context) {
    final probius = ProbiusProxy.of(context).getById(widget.probiusId);
    final project = ProjectProxy.of(context).getById(probius.projectId);

    return WebScaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 24),
            Observer(
              builder: (_) => Text18('Project: ${project.name}'),
            ),
            const SizedBox(height: 24),
            //

            const Text18('Billing Periods:'),
            const SizedBox(height: 24),

            Observer(builder: (_) {
              ObservableList billIdList =
                  Lad.of(context).billIdListByProbiusIdCache.apiGetById(
                        id: widget.probiusId,
                        forceApi: _forceLoad,
                        collectionCache: Lad.of(context).challengeCache,
                      );

              List<Bill> bills = Lad.of(context)
                  .billCache
                  .getItemsAsList(List.from(billIdList));

              if (bills.isEmpty) {
                _forceLoad = true;
              } else {
                _forceLoad = false;
              }

              return ListView.separated(
                shrinkWrap: true,
                itemCount: bills.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  var bill = bills[index];
                  return FunctionCard(
                      text:
                          'Bill for ${periodToHuman(bill.period)}. Status: ${bill.status}',
                      onTap: () {
                        context.goNamed(
                          Routes.billOverview,
                          params: Args(
                                  billId: bill.billId,
                                  probiusId: widget.probiusId)
                              .asMap(),
                        );
                      });
                },
              );
            }),
            const SizedBox(height: 24),
          ]),
    );
  }
}
