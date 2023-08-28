import 'package:tui_lib/tui_lib.dart';

class SurferWrapper extends StatelessWidget {
  final Widget body;
  final String surferId;

  const SurferWrapper({
    required this.body,
    required this.surferId,
  });

  @override
  Widget build(BuildContext context) {
    final surfer = SurferProxy.of(context).getById(surferId);
    return WebScaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 200,
            child: Observer(
              builder: (_) => SurferNavBar(surferId, surfer.projectId),
            ),
          ),
          //

          Expanded(
            child: Scrollbar(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SurferNavBar extends StatelessWidget {
  final String projectId;
  final String surferId;
  const SurferNavBar(this.surferId, this.projectId);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Observer(
        builder: (_) {
          final project = ProjectProxy.of(context).getById(projectId);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //
              const SizedBox(height: 24),

              TextButton(
                onPressed: () {
                  context.goNamed(
                    Routes.surfer,
                    params: Args(surferId: surferId).asMap(),
                  );
                },
                child: const Text18('Profile'),
              ),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  context.goNamed(
                    Routes.surferPlan,
                    params: Args(surferId: surferId).asMap(),
                  );
                },
                child: const Text18('Plan'),
              ),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  context.goNamed(
                    Routes.surferPayment,
                    params: Args(probiusId: project.probiusId).asMap(),
                  );
                },
                child: const Text18('Billing & Payments'),
              ),
              const SizedBox(height: 6),

              const Divider(
                color: Colors.grey,
                height: 6,
                endIndent: 20,
                thickness: 1,
              ),

              TextButton(
                onPressed: () {
                  context.go(Routes.contact);
                },
                child: const Text18('Contact Us'),
              ),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  context.go(Routes.privacy);
                },
                child: const Text18('Privacy'),
              ),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  context.go(Routes.faq);
                },
                child: const Text18('FAQ'),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
