import 'package:flutter/material.dart';
import 'package:rename_lanhu/infrasture/dependency_injection/injector.dart';

import 'home_page.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTextStyle(
          style: TextStyle(
            fontSize: 30,
          ),
          child: HomePage(title: 'Rename')),
    );
  }
}
