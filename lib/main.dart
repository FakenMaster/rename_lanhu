import 'package:flutter/material.dart';
import 'package:rename_lanhu/presentation/navigator2/nested_navigator_app.dart';
import 'infrasture/dependency_injection/injector.dart';
import 'presentation/app/app_widget.dart';
import 'package:rename_lanhu/presentation/navigator2/book.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // runApp(AppWidget());
  nestedMain();
}
