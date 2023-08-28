import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/console/console_wrapper.dart';

class ConsolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ConsoleWrapper(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text20('Console page'),
          ],
        ),
      ),
    );
  }
}
