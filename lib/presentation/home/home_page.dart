import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rename_lanhu/application/rename_folder/bloc/rename_folder_bloc.dart';
import 'package:rename_lanhu/infrasture/dependency_injection/injector.dart';
import 'package:rename_lanhu/presentation/rename_folder/rename_folder_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RenameFolderBloc>(
          create: (context) => getIt<RenameFolderBloc>(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Row(
            children: [
              NavigationRail(
                destinations: [
                  NavigationRailDestination(
                      icon: Icon(Ionicons.folder_outline),
                      selectedIcon: Icon(Ionicons.folder),
                      label: Text('文件夹')),
                  NavigationRailDestination(
                      icon: Icon(Ionicons.document_outline),
                      selectedIcon: Icon(Ionicons.document),
                      label: Text('文件')),
                  NavigationRailDestination(
                      icon: Icon(Ionicons.terminal_outline),
                      selectedIcon: Icon(Ionicons.terminal),
                      label: Text('命令行')),
                ],
                selectedIndex: selectIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectIndex = value;
                  });
                },
                labelType: NavigationRailLabelType.all,
              ),
              VerticalDivider(
                thickness: 1,
                width: 1,
              ),
              Expanded(
                child: selectIndex == 0
                    ? RenameFolderPage()
                    : Text('$selectIndex:${Random().nextInt(100)}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
