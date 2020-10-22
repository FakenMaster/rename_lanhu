import 'package:flutter/material.dart';
import 'package:rename_lanhu/infrasture/util/color.dart';
import 'package:rename_lanhu/presentation/home/home_page.dart';
import 'package:create_material_color/create_material_color.dart';
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rename Lanhu Images',
      theme: ThemeData(
        primarySwatch: LibraryColor.Primay.materialColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTextStyle(
          style: TextStyle(
            fontSize: 50,
          ),
          child: HomePage(title: 'Rename Lanhu Images')),
    );
  }
}
