import 'dart:async';

import 'package:flutter/material.dart';

import 'app.dart';
import 'core/dependencies/bloc_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() async {
    runApp(AppMainBlocProvider(child: MyApp()));
  }, (_, __) {});
}
