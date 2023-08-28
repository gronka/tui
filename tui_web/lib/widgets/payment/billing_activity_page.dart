import 'package:tui_lib/tui_lib.dart';

class BillingActivityPage extends StatefulWidget {
  final String probiusId;
  const BillingActivityPage({required this.probiusId});

  @override
  BillingActivityPageState createState() => BillingActivityPageState();
}

class BillingActivityPageState extends State<BillingActivityPage> {
  bool showAllMethods = false;
  final SelectPeriodData data = SelectPeriodData();

  @override
  Widget build(BuildContext context) {
    final probius = ProbiusProxy.of(context).getById(widget.probiusId);
    final project = ProjectProxy.of(context).getById(probius.projectId);
    data.probius = probius;

    return WebScaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 24),
                Observer(
                  builder: (_) => Text18('Project: ${project.name}'),
                ),
                const SizedBox(height: 24),
                //

                const Text18('Select a billing period'),
                const SizedBox(height: 24),

                SelectPeriod(data: data),
                const SizedBox(height: 24),

                Observer(
                  builder: (_) => data.isSelectedDateValid
                      ? Text18(
                          'Showing the billing activity for the period of ${data.printSelectedDate}.')
                      : const SizedBox.shrink(),
                ),
                const SizedBox(height: 24),

                Observer(
                  builder: (_) => data.isSelectedDateValid
                      ? ActivitySummary(
                          month: data.selectedMonth,
                          project: project,
                          year: data.selectedYear,
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(height: 24),

                //FunctionCard(
                //text: 'Download as a .csv document (in progress)',
                //onTap: () {},
                //),
                //
              ]),
        ),
      ),
    );
  }
}

class ActivitySummary extends StatefulWidget {
  const ActivitySummary({
    required this.month,
    required this.year,
    required this.project,
  });
  final int month;
  final Project project;
  final int year;

  @override
  ActivitySummaryState createState() => ActivitySummaryState();
}

class ActivitySummaryState extends State<ActivitySummary> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return const Column(
          children: <Widget>[
            SizedBox(height: 24),
            SimpleRow(left: 'Activity summary here', right: ''),
            SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
