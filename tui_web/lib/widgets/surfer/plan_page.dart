import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/surfer/surfer_wrapper.dart';

class PlanPage extends StatefulWidget {
  final String surferId;
  const PlanPage({required this.surferId});

  @override
  PlanPageState createState() => PlanPageState();
}

class PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return SurferWrapper(
      surferId: widget.surferId,
      body: Center(
        child: Observer(builder: (_) {
          var surfer = SurferProxy.of(context).getById(widget.surferId);
          var project = ProjectProxy.of(context).getById(surfer.projectId);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PlanOption('free', project),
              const SizedBox(height: 12),
              PlanOption('small', project),
              const SizedBox(height: 12),
              PlanOption('medium', project),
              const SizedBox(height: 12),
              PlanOption('large', project),
              const SizedBox(height: 12),
              PlanOption('contact', project),
            ],
          );
        }),
      ),
    );
  }
}

class PlanOption extends StatelessWidget {
  const PlanOption(this.planId, this.project);
  final String planId;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      var currentPlanId = project.planId;
      var plan = PlanProxy.of(context).getById(planId);

      return Center(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //

              ListTile(
                leading: Icon(plan.icon, size: 32),
                title: Text20(plan.title),
                subtitle: Text18(plan.description, maxLines: 5),
              ),
              const SizedBox(height: 6),

              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text18(plan.subscriptionPriceText),
              ),

              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //

                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Text18(plan.tokenPriceText),
                  ),
                  const Expanded(
                    child: SizedBox(width: 10),
                  ),

                  TextButton(
                    onPressed: planId == currentPlanId
                        ? null
                        : () {
                            context.goNamed(
                              Routes.planChange,
                              params: Args(
                                      planId: planId,
                                      projectId: project.projectId)
                                  .asMap(),
                            );
                          },
                    child: planId == currentPlanId
                        ? const Text18('This is your current plan')
                        : const Text18('Change to this plan'),
                  ),

                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      );
    });
  }
}
