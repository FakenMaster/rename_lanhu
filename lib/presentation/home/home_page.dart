import 'dart:math';
import 'package:rename_lanhu/application/drop_down_list/widget/dropdown_menu_widget.dart';
import 'package:rename_lanhu/infrasture/util/util.dart';
import 'package:rename_lanhu/presentation/rename_file/rename_file_page.dart';
import 'package:time/time.dart';
import 'package:dartz/dartz.dart' show Tuple3, Tuple3;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:rename_lanhu/application/rename_folder/cubit/rename_folder_cubit.dart';
import 'package:rename_lanhu/infrasture/dependency_injection/injector.dart';
import 'package:rename_lanhu/presentation/rename_folder/rename_folder_page.dart';
import 'package:rename_lanhu/presentation/terminal/terminal_page.dart';
import 'package:stringx/stringx.dart';

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
                physics: NeverScrollableScrollPhysics(),
                children: [
                  RenameFolderPage(),
                  RenameFilePage(),
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
    return SafeArea(
      child: Scaffold(
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
            ),
            SizedBox(
              height: 100,
            ),
            DropdownMenuWidget(titles: ['地域','用地类型','筛选'],),
          ],
        ),
        // floatingActionButton: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     MyButton(),
        //   ],
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  OverlayEntry _overlayEntry;
  int currentIndex;
  final List<Tuple3<IconData, Color, String>> iconDatas = [
    Tuple3(
        Ionicons.logo_facebook, Color.fromARGB(255, 72, 103, 170), 'Facebook'),
    Tuple3(Ionicons.logo_amazon, Color.fromARGB(255, 254, 148, 0), 'Amazon'),
    Tuple3(Ionicons.logo_apple, Colors.white, 'Apple'),
    Tuple3(Ionicons.logo_twitter, Color.fromARGB(255, 30, 162, 241), 'Twitter'),
    Tuple3(Ionicons.logo_google, Color.fromARGB(255, 235, 65, 50), 'Google'),
  ];
  @override
  void dispose() {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: iconDatas
          .mapWithIndex(
            (index, value) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: FloatingActionButton(
                  heroTag: '$index',
                  onPressed: () {
                    operateOverlayEntry(index);
                  },
                  child: Icon(
                    value.value1,
                    color: value.value2,
                  )),
            ),
          )
          .toList(),
    );
  }

  operateOverlayEntry(int index) {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
    }
    if (currentIndex != index) {
      currentIndex = index;
      _overlayEntry = _createOverlayEntry(index);
      Overlay.of(context).insert(this._overlayEntry);
    } else {
      currentIndex = null;
    }
  }

  OverlayEntry _createOverlayEntry(int index) {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    print('Size:$size');
    var offset = renderBox.localToGlobal(Offset.zero);
    print('Offset:$offset');

    final data = iconDatas[index];
    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        // width: size.width,
        right: 0,
        // bottom: 40,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight:
                MediaQuery.of(context).size.height - offset.dy - size.height-40,
          ),
          child: Material(
            elevation: 4.0,
            child: Card(
              color: LibraryColor.Primay,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: <Widget>[
                  for (int i = 0; i < 20; i++)
                    ListTile(
                      leading: Icon(
                        data.value1,
                        color: data.value2,
                      ),
                      title: Text('${data.value3}+' * (i + 1)),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
