import 'dart:math';
import 'package:time/time.dart';
import 'package:dartz/dartz.dart' show Tuple3;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:rename_lanhu/application/rename_folder/cubit/rename_folder_cubit.dart';
import 'package:rename_lanhu/infrasture/dependency_injection/injector.dart';
import 'package:rename_lanhu/presentation/rename_folder/rename_folder_page.dart';
import 'package:rename_lanhu/presentation/terminal/terminal_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
  final navigations = [
    Tuple3(Ionicons.folder_outline, Ionicons.folder_open, '文件夹'),
    Tuple3(Ionicons.document_outline, Ionicons.document, '文件'),
    Tuple3(Ionicons.terminal_outline, Ionicons.terminal, '命令行'),
    Tuple3(Ionicons.terminal_outline, Ionicons.terminal, '按钮'),
  ];

  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: selectIndex,
    )..addListener(() {
        context.read<PageAndCount>().page = selectIndex;
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              extended: true,
              groupAlignment: 0.0,
              destinations: navigations
                  .map(
                    (e) => NavigationRailDestination(
                      icon: Icon(e.value1, size: 25),
                      selectedIcon: Icon(e.value2, size: 25),
                      label: Text(
                        '${e.value3}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              selectedIndex: selectIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectIndex = value;
                  pageController.jumpToPage(selectIndex);
                });
              },
              // labelType: NavigationRailLabelType.all,
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  RenameFolderPage(),
                  TextPage(),
                  TerminalPage(),
                  ButtonPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextPage extends StatefulWidget {
  const TextPage({Key key}) : super(key: key);
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage>
    with AutomaticKeepAliveClientMixin {
  int ok;
  bool needRefresh = true;
  @override
  void initState() {
    super.initState();
    print('TextPage初始化:$ok');
  }

  @override
  void dispose() {
    print('TextPage销毁');
    super.dispose();
  }

  /// initState调用之后，这个方法马上被调用。
  /// 但是什么情况下，initState不调用，这个方法会调用呢？？？
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('TextPage didChangeDependencies:$ok');
  }

  @override
  Widget build(BuildContext context) {
    print('TextPage刷新:$ok');
    checkIfRefresh();
    return Column(
      children: [
        Text('ok:$ok, next:${Random().nextInt(100)}'),
        RaisedButton(
          onPressed: () {
            setState(() {});
          },
          child: Icon(Ionicons.refresh),
        )
      ],
    );
  }

  void checkIfRefresh() {
    bool isCurrentPage =
        Provider.of<PageAndCount>(context, listen: false).page == 1;
    int newCount = Provider.of<PageAndCount>(context, listen: false).count;
    if (isCurrentPage) {
      if (!needRefresh || ok == newCount) {
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          ok = newCount;
          needRefresh = false;
        });
      });
    } else {
      needRefresh = true;
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key key}) : super(key: key);
  @override
  _ButtonState createState() => _ButtonState();
}

class PageAndCount {
  int page;
  int count;
}

class _ButtonState extends State<ButtonPage>
    with AutomaticKeepAliveClientMixin {
  int value;
  @override
  void initState() {
    super.initState();
    print('ButtonPage初始化');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    randomValue();
  }

  randomValue() {
    value = Random().nextInt(300);
    context.read<PageAndCount>().count = value;
  }

  @override
  void dispose() {
    print('ButtonPage销毁');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('$value'),
          RaisedButton(
            onPressed: () {
              setState(() {
                randomValue();
              });
            },
            child: Icon(Ionicons.refresh),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            randomValue();
          });
        },
        child: Icon(Ionicons.logo_vue),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
