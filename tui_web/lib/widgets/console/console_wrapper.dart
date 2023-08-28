import 'package:tui_lib/tui_lib.dart';

class ConsoleWrapper extends StatelessWidget {
  final Widget body;
  const ConsoleWrapper({
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 200,
            child: ConsoleNavBar(),
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

class ConsoleNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //
          TextButton(
            onPressed: () {
              context.go(Routes.challenges);
            },
            child: const Text18('My Challenges'),
          ),
          const SizedBox(height: 8),

          TextButton(
            onPressed: () {
              context.go(Routes.properties);
            },
            child: const Text18('My Properties'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
