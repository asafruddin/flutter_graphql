// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_architecture/app/app.dart';
import 'package:flutter_graphql_architecture/core/di/injector_container.dart'
    as di;

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

    await di.init();
    runApp(const MyApp());
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
