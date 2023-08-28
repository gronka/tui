import 'package:tui_lib/tui_lib.dart';

class PlanSelectTable extends StatefulWidget {
  const PlanSelectTable({required this.projectId});
  final String projectId;

  @override
  PlanSelectTableState createState() => PlanSelectTableState();
}

class PlanSelectTableState extends State<PlanSelectTable> {
  String _failureMsg = '';
  bool _requestInProgress = false;

  @override
  Widget build(BuildContext context) {
    var project = ProjectProxy.of(context).getById(widget.projectId);

    void showConfirmCancellationModal(BuildContext context) {
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
                    const Text(
                        'Are you sure you want to cancel your plan change?'),
                    const SizedBox(height: 12),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text('Yes'),
                            onPressed: () => _submitCancellation(context),
                          ),
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

    return WebScaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 6),
            Observer(builder: (_) {
              var currentPlan = PlanProxy.of(context).getById(project.planId);

              return BaText('Current plan: ${currentPlan.title}');
            }),
            const SizedBox(height: 12),
            Observer(builder: (_) {
              var nextPlan = PlanProxy.of(context).getById(project.planIdNext);

              return (project.planId != project.planIdNext)
                  ? Row(children: <Widget>[
                      BaText(
                          'You have configured your plan to change to ${nextPlan.title} on ${project.timePlanExpiresForDisplay}.'),
                      const SizedBox(width: 6),
                      TextButton(
                        child: const Text('Cancel plan change'),
                        onPressed: () {
                          showConfirmCancellationModal(context);
                        },
                      ),
                    ])
                  : const BaText(
                      'Want to grow your network? Upgrade your plan!');
            }),
            _failureMsg == ''
                ? const SizedBox(height: 0)
                : Text(_failureMsg, style: failureStyle()),
            const SizedBox(height: 12),

            Observer(builder: (_) {
              var currentPlan = PlanProxy.of(context).getById(project.planId);

              var smallPlan = PlanProxy.of(context).getById('small');
              var mediumPlan = PlanProxy.of(context).getById('medium');
              var largePlan = PlanProxy.of(context).getById('large');

              return Table(
                //border: TableBorder.symmetric(
                //inside: const BorderSide(width: 1, color: Colors.blue),
                //),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const <int, TableColumnWidth>{
                  //0: IntrinsicColumnWidth(),
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  //4: FlexColumnWidth(),
                  //4: FixedColumnWidth(64),
                },
                children: <TableRow>[
                  TableRow(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue),
                      ),
                    ),
                    children: <Widget>[
                      const LocalCell(''),
                      ColumnTitle(smallPlan.title),
                      ColumnTitle(mediumPlan.title),
                      ColumnTitle(largePlan.title),
                      //ColumnTitle(PlanProxy.of(context.getById('small'))),
                    ],
                  ),
                  //

                  const TableRow(
                    children: <Widget>[
                      RowTitle('Price'),
                      LocalCell('Free'),
                      LocalCell('\$20 / year'),
                      LocalCell('\$60 / year'),
                      //LocalCell('\$500 / year'),
                    ],
                  ),
                  //

                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    children: const <Widget>[
                      RowTitle('Subscriber limit'),
                      LocalCell('5'),
                      LocalCell('unlimited', isItalic: true),
                      LocalCell('unlimited', isItalic: true),
                      //LocalCell('unlimited', isItalic: true),
                    ],
                  ),
                  //

                  const TableRow(
                    children: <Widget>[
                      RowTitle('Channel limit'),
                      LocalCell('2'),
                      LocalCell('6'),
                      LocalCell('unlimited', isItalic: true),
                      //LocalCell('unlimited', isItalic: true),
                    ],
                  ),
                  //

                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    children: const <Widget>[
                      RowTitle('Bundled Static* notifications'),
                      LocalCell('100'),
                      LocalCell('100,000'),
                      LocalCell('600,000'),
                      //LocalCell('8,000,000'),
                    ],
                  ),
                  //

                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    children: const <Widget>[
                      RowTitle('Bundled Custom** notifications'),
                      LocalCell('50'),
                      LocalCell('1,000'),
                      LocalCell('20,000'),
                      //LocalCell('100,000'),
                    ],
                  ),
                  //

                  const TableRow(
                    children: <Widget>[
                      RowTitle('Bundled Limitless*** notificiations'),
                      LocalCell('50'),
                      LocalCell('1,000'),
                      LocalCell('20,000'),
                      //LocalCell('100,000'),
                    ],
                  ),
                  //

                  const TableRow(
                    children: <Widget>[
                      Column(children: <Widget>[
                        SizedBox(height: 6),
                        RowTitle('Additional Notifications:'),
                        RowTitle('  - Static'),
                      ]),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: LocalCell('-'),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: LocalCell('\$10 / 100,000'),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: LocalCell('\$7 / 100,000'),
                      ),
                      //TableCell(
                      //verticalAlignment: TableCellVerticalAlignment.bottom,
                      //child: LocalCell('\$4 / 100,000'),
                      //),
                    ],
                  ),
                  //

                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    children: const <Widget>[
                      RowTitle('  - Custom'),
                      LocalCell('-'),
                      LocalCell('\$10 / 10,000'),
                      LocalCell('\$7 / 10,000'),
                      //LocalCell('\$4 / 10,000'),
                    ],
                  ),
                  //

                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    children: const <Widget>[
                      RowTitle('  - Limitless'),
                      LocalCell('-'),
                      LocalCell('\$20 / 10,000'),
                      LocalCell('\$14 / 10,000'),
                      //LocalCell('\$8 / 10,000'),
                    ],
                  ),
                  //

                  TableRow(
                    children: <Widget>[
                      const RowTitle(''),
                      SelectPlanButton(
                        planId: smallPlan.planId,
                        isCurrentPlan: smallPlan.planId == currentPlan.planId,
                        projectId: widget.projectId,
                      ),
                      SelectPlanButton(
                        planId: mediumPlan.planId,
                        isCurrentPlan: mediumPlan.planId == currentPlan.planId,
                        projectId: widget.projectId,
                      ),
                      SelectPlanButton(
                        planId: largePlan.planId,
                        isCurrentPlan: largePlan.planId == currentPlan.planId,
                        projectId: widget.projectId,
                      ),
                      //SelectPlanButton(
                      //planId: 4,
                      //isCurrentPlan: 4 == currentPlan.planId,
                      //project: project,
                      //),
                    ],
                  ),
                ],
              );
            }),
            const SizedBox(height: 20),
            //

            const Text(
              '* Static notifications send custom image and text that can only be changed periodically.',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const Text(
              '** Custom notifications allow custom image and text for every notification.',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const Text(
              '*** Limitless notifications allow custom text, images, sounds, and layouts.',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const Text(
              'Unused notifications do not expire.',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  _submitCancellation(BuildContext context) async {
    var king = King.of(context);
    if (!_requestInProgress) {
      setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await king.lip.api(
        EndpointsV2.projectPlanIdNextCancel,
        payload: {
          'ProjectId': widget.projectId,
        },
      );

      setState(() {
        _requestInProgress = false;
      });

      if (ares.isOk) {
        if (!mounted) return;
        ProjectProxy.of(context).getById(widget.projectId, forceApi: true);
        context.pop();
      } else {
        setState(() {
          _failureMsg =
              'Failed to cancel your plan change. Try contacting support.';
        });
      }
    }
  }
}

class ColumnTitle extends StatelessWidget {
  const ColumnTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          //fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class RowTitle extends StatelessWidget {
  const RowTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class LocalCell extends StatelessWidget {
  const LocalCell(
    this.text, {
    this.isItalic = false,
  });
  final bool isItalic;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Text(
        text,
        style: isItalic
            ? const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              )
            : const TextStyle(fontSize: 18),
      ),
    );
  }
}

class SelectPlanButton extends StatelessWidget {
  const SelectPlanButton({
    required this.isCurrentPlan,
    required this.planId,
    required this.projectId,
  });
  final bool isCurrentPlan;
  final String planId;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Card(
        elevation: 2,
        color: isCurrentPlan ? Colors.grey : Colors.red,
        child: InkWell(
          onTap: isCurrentPlan
              ? null
              : () {
                  context.goNamed(
                    Routes.planChange,
                    params: Args(planId: planId, projectId: projectId).asMap(),
                  );
                },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Center(
              child: Text(
                isCurrentPlan ? 'Current plan' : 'Select',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
