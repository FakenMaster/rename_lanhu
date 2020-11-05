import 'package:flutter/material.dart';
import 'infrasture/dependency_injection/injector.dart';
import 'presentation/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(AppWidget());
}
