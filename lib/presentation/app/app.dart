import 'package:flutter/material.dart';
import 'package:rename_lanhu/presentation/home/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
