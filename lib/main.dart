import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/di/core_module_container.dart';
import 'package:gaspay_mobile/core/presentation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
