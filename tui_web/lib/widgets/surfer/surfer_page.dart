import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/surfer/surfer_wrapper.dart';

class SurferPage extends StatefulWidget {
  final String surferId;
  const SurferPage({required this.surferId});

  @override
  SurferPageState createState() => SurferPageState();
}

class SurferPageState extends State<SurferPage> {
  @override
  Widget build(BuildContext context) {
    return SurferWrapper(
      surferId: widget.surferId,
      body: Center(
        child: Observer(builder: (_) {
          var surfer = SurferProxy.of(context).getById(widget.surferId);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //
              const SizedBox(height: 24),

              Observer(
                builder: (_) => Row(
                  children: <Widget>[
                    Text18('First Name: ${surfer.firstName}'),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const BaText('Edit'),
                      onPressed: () {
                        context.goNamed(
                          Routes.surferSetFirstName,
                          params: Args(surferId: widget.surferId).asMap(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              //Text18(developer.email),
              const DividerOverview(),

              Row(
                children: <Widget>[
                  Text18('Last Name: ${surfer.lastName}'),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const BaText('Edit'),
                    onPressed: () {
                      context.goNamed(
                        Routes.surferSetLastName,
                        params: Args(surferId: widget.surferId).asMap(),
                      );
                    },
                  ),
                ],
              ),
              //Text18(developer.email),
              const DividerOverview(),

              Row(
                children: <Widget>[
                  Text18('Phone: ${surfer.phone}'),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const BaText('Edit'),
                    onPressed: () {
                      context.goNamed(
                        Routes.surferSetPhone,
                        params: Args(surferId: widget.surferId).asMap(),
                      );
                    },
                  ),
                ],
              ),
              //Text18(developer.phone),
              const DividerOverview(),

              Row(
                children: <Widget>[
                  Text18('Email: ${surfer.email}'),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const BaText('Change'),
                    onPressed: () {
                      context.goNamed(
                        Routes.surferSetEmail,
                        params: Args(surferId: widget.surferId).asMap(),
                      );
                    },
                  ),
                ],
              ),
              //Text18(developer.email),
              const DividerOverview(),

              Row(
                children: <Widget>[
                  const Text18('Password'),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const BaText('Change'),
                    onPressed: () {
                      context.goNamed(
                        Routes.surferSetPassword,
                        params: Args(surferId: widget.surferId).asMap(),
                      );
                    },
                  ),
                ],
              ),
              const DividerOverview(),

              FunctionCard(
                  text: 'Sign Out',
                  onTap: () {
                    King.of(context).todd.signOut();
                    context.go(Routes.home);
                  }),
            ],
          );
        }),
      ),
    );
  }
}
