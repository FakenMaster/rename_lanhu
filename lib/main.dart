import 'package:flutter/material.dart';
import 'package:rename_lanhu/infrasture/dependency_injection/injector.dart';

import 'presentation/app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

