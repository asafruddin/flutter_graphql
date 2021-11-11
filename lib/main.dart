// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_graphql_architecture/app/app.dart';
import 'package:flutter_graphql_architecture/core/di/injector_container.dart'
    as di;
import 'package:flutter_graphql_architecture/env/config.dart';
import 'package:flutter_graphql_architecture/env/flavor.dart';

/// get debug mode
bool get isInDebugMode {
  var inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

void main() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await getFlavorSetting();
    await di.init();
    runApp(const MyApp());

    /// [console] flavor running
    if (!kReleaseMode) {
      final settings = Config.getInstance();
      print('🚀 APP FLAVOR NAME  : ${settings.flavorName}');
      print('🚀 APP BASE_URL     : ${settings.baseUrl}');
    }
  }, (e, s) async {
    if (isInDebugMode) {
      print('🔴 In dev mode. Not sending report.');
      print('ERROR :$e');
      print('STACKTRACE :$s');
    } else {
      print('🔴 OTHER_ERROR   :$e');
      print('🔴 STACKTRACE    :$s');
    }
  });
}

///environment configuration
Future<FlavorSetting> getFlavorSetting() async {
  final flavor =
      await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
  switch (flavor) {
    case 'development':
      return FlavorSetting.development();
    case 'staging':
      return FlavorSetting.staging();
    case 'production':
      return FlavorSetting.production();
    default:
      throw Exception('㊗️ Oopss... Flavor name missing');
  }
}
