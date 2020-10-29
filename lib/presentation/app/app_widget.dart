import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rename_lanhu/application/rename_folder/cubit/rename_folder_cubit.dart';
import 'package:rename_lanhu/infrasture/dependency_injection/injector.dart';
import 'package:rename_lanhu/infrasture/util/src/color.dart';
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
        child: MultiProvider(
          providers: [
            BlocProvider<RenameFolderCubit>(
              create: (context) => getIt<RenameFolderCubit>(),
            ),
            Provider<PageAndCount>(create: (_) => PageAndCount())
          ],
          child: HomePage(title: 'Rename Lanhu Images'),
        ),
      ),
    );
  }
}
