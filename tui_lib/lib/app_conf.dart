import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:logger/logger.dart';
import 'package:universal_io/io.dart';

import 'package:tui_lib/services/address_pool.dart';

enum ClockFormat { twelve, twentyFour }

enum ToddMode { none, admin, developer, surfer }

enum DevicePlatform { none, and }

class AppConf {
  final AddressPool apiPool = AddressPool();

  // instanceId is often the firebaseToken
  final String instanceId;

  static String env = const String.fromEnvironment('ENV', defaultValue: 'dev');
  static String siteUrl =
      const String.fromEnvironment('SITE_URL', defaultValue: 'notset');

  final String appName = 'FairlyTaxed';
  final Level logLevel = Level.verbose;
  final String stripePublishableKey =
      const String.fromEnvironment('STRIPE_PKEY');
  final String tzFormat = 'standard';

  // cacheErrorThrottleMilliseconds not implemented
  final int cacheErrorThrottleMilliseconds = 0;
  // cacheThrottleMilliseconds throttles requests to the api if too quick
  final int cacheThrottleMilliseconds = 800;
  final int cacheExpireMinutesPart = 0;
  final int cacheExpireSecondsPart = 5;
  late int cacheExpireMilliseconds;
  final ToddMode toddMode = ToddMode.admin;
  final bool debug = true;
  final String loadingImageUrl = 'https://pushboi.io/img/loading.webp';
  late String platform;
  final int requestTimeout = 10;

  late bool mockAutoSignIn;

  AppConf({required this.instanceId}) {
    //print('Configuration initializaing...');

    if (kIsWeb) {
      platform = 'web';
    } else {
      if (Platform.isAndroid) {
        platform = 'android';
      } else if (Platform.isIOS) {
        platform = 'ios';
      } else if (Platform.isLinux) {
        platform = 'linux';
      } else if (Platform.isWindows) {
        platform = 'windows';
      } else if (Platform.isMacOS) {
        platform = 'macos';
      } else if (Platform.isFuchsia) {
        platform = 'fuchsia';
      }
    }

    cacheExpireMilliseconds =
        cacheExpireMinutesPart * 60000 + cacheExpireSecondsPart * 1000;

    switch (env) {
      case 'dev':
        mockAutoSignIn = false;
        switch (platform) {
          case 'web':
          case 'ios':
            apiPool.addAddress('http://127.0.0.1', 'api/');
            //apiPool.addAddress('https://localhost:80', 'api');
            break;

          case 'android':
            //apiPool.addAddress('http://10.0.2.2', 'api');
            apiPool.addAddress('http://10.0.2.2', 'api/');
            break;

          case 'linux':
          case 'windows':
          case 'macos':
          case 'fuchsia':
          default:
            apiPool.addAddress('http://127.0.0.1', 'api/');
        }
        break;

      case 'lab':
        throw Exception('lab environment not configured');

      case 'prod':
        mockAutoSignIn = false;
        //apiPool.addAddress('https://api.cheese.rodeo:8050', 'api');
        apiPool.addAddress('https://fairlytaxed.com', 'api');
        //apiPool.addAddress('http://127.0.0.1', 'api/');
        break;

      default:
        throw Exception('ERROR: env could not be found: $env');
    }

    print('API Url Pool: ${apiPool.printfAddresses()}');
    if (apiPool.isEmpty) {
      throw Exception('ERROR: no apiPool are set');
    }
    print('Configuration initialization completed.');
  }

  bool get isAndroid {
    return platform == 'android';
  }

  bool get isIos {
    return platform == 'ios';
  }

  bool get isLinux {
    return platform == 'linux';
  }

  bool get isMacOs {
    return platform == 'ios';
  }

  bool get isWeb {
    return platform == 'web';
  }

  String get signInWithAppleClientId {
    if (isAndroid) {
      return 'io.fairlytaxed.and';
    } else if (isIos || isMacOs) {
      return 'io.fairlytaxed.ios';
    } else {
      return 'PlatformNotSupported';
    }
  }

  Uri get signInWithAppleFairlyTaxedCallback {
    if (isWeb) {
      return Uri.parse('https://fairlytaxed.com');
    } else if (isAndroid) {
      return Uri.parse(
          'https://fairlytaxed.com/api/surfer/signIn.withApple.callback.android');
    } else {
      return Uri.parse('https://notset');
    }
  }

  String calling() {
    var data = {'hi': 'okay'};
    return 'intent://callback?$data#Intent;package=YOUR.PACKAGE.IDENTIFIER;scheme=signinwithapple;end';
  }
}
