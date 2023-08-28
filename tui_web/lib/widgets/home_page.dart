import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/challenge/challenges_page.dart';
import 'package:tui_web/widgets/iframe_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => King.of(context).todd.isSignedIn
          ? const ChallengesPage()
          : IFramePage(
              elId: Routes.welcome,
              url: '${AppConf.siteUrl}/static/welcome.html'),
    );
  }
}
