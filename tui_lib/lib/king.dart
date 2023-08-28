import 'package:logger/logger.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:tui_lib/tui_lib.dart';

class King {
  AppConf conf;
  late Box box;
  //late Deep deep;
  late Lad lad;
  late Pad pad;
  late Plogger plog;
  late Lip lip;
  final navigatorKey = GlobalKey<NavigatorState>();
  final Snacker snacker = Snacker();
  late ThemeSelect theme;
  late Todd todd;

  King({required this.conf}) {
    this.theme = ThemeSelect();

    // depends only on conf
    this.lip = Lip(this, pool: conf.apiPool);
    this.plog = Plogger(
      level: Level.verbose,
      lip: lip,
      name: this.conf.appName,
      platform: conf.platform,
    );

    // depends on 'this'
    this.lad = Lad(this);
    this.pad = Pad(this);
    //this.deep = Deep(this);
    this.todd = Todd(this);
    todd.toddMode = conf.toddMode;

    if (this.conf.mockAutoSignIn) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (!todd.isSignedIn) {
          Future.delayed(const Duration(milliseconds: 200), () {
            this.todd.signInWithEmail(email: '2@2.2', password: 'asdf');
          });
        }
      });
    }
  }

  initAsyncObjects() async {
    await Hive.initFlutter();
    box = await Hive.openBox('box');

    //todd.loadLogin();

    //deep.initAppLinks();
  }

  static King of(BuildContext context) {
    return Provider.of<King>(context, listen: false);
  }

  // signOutCleanup should destroy all personal information
  void signOutCleanup() {
    //this.pac = Pac();
    this.lad = Lad(this);
    this.pad = Pad(this);
  }
}
