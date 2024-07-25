import 'package:flutter/material.dart';
import 'package:flutter_mobile_template/core/di/core_module_container.dart';
import 'package:flutter_mobile_template/core/presentation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}
