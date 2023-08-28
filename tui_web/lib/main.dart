import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:uuid/uuid.dart';

import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/app.dart';

void main() async {
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }

// for web, we generate our own instanceId as a uuid
  var uuid = const Uuid();

  AppConf defaultConf = AppConf(instanceId: uuid.v1());
  King defaultKing = King(conf: defaultConf);

  print(defaultKing.conf.instanceId);
  print(defaultKing.conf.instanceId);
  print(defaultKing.conf.instanceId);
  print(defaultKing.conf.instanceId);
  print(defaultKing.conf.instanceId);
  print(defaultKing.conf.instanceId);

  await defaultKing.initAsyncObjects();
  runApp(MyApp(king: defaultKing));
}
