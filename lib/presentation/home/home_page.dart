import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:rename_lanhu/application/drop_down_list/widget/dropdown_menu_widget.dart';
import 'package:rename_lanhu/infrasture/util/util.dart';
import 'package:rename_lanhu/presentation/dropdown_overlay/dropdown_overlay_widget.dart';
import 'package:rename_lanhu/presentation/navigator2/book/book.dart';
import 'package:rename_lanhu/presentation/popup/toast.dart';
import 'package:rename_lanhu/presentation/rename_file/rename_file_page.dart';
import 'package:time/time.dart';
import 'package:dartz/dartz.dart' show Tuple3, Tuple3;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:rename_lanhu/presentation/rename_folder/rename_folder_page.dart';
import 'package:rename_lanhu/presentation/terminal/terminal_page.dart';
import 'package:stringx/stringx.dart';
import 'package:rename_lanhu/presentation/opacity&offstage&visibility/index.dart'
    as oov;

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
    Tuple3(Ionicons.egg_outline, Ionicons.egg, 'stingy'),
    Tuple3(Ionicons.podium_outline, Ionicons.podium, '弹出下拉框'),
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
                  StingyTest(),
                  // ChildWidgetFromOutside(
                  //     child1: MyText2(Random().nextInt(200)),
                  //     child2Builder: (context) =>
                  //         MyText2(Random().nextInt(200))),

                  // PopupPage(),
                  // Navigator2(),
                  BooksPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyText2 extends StatelessWidget {
  final int old;
  MyText2(this.old);
  @override
  Widget build(BuildContext context) {
    return Text('$old : ${Random().nextInt(300)}');
  }
}

class MyText extends StatefulWidget {
  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  int old;
  @override
  void initState() {
    super.initState();
    old = Random().nextInt(200);
  }

  @override
  Widget build(BuildContext context) {
    return Text('$old : ${Random().nextInt(300)}');
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
  /// 但是什么情况下，initState不调用，这个方法会调用呢？？？：在使用了InheritedWidget，并且使得InheritedWidget属性改变时，枝叶child会
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

  double _currentSliderValue = 128;
  bool offstage = false;
  bool visible = true;
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
              height: 10,
            ),
            DropdownMenuWidget(
              titles: ['地域', '用地类型', '筛选'],
            ),
            SizedBox(
              height: 10,
            ),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 255,
              divisions: 255,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            oov.Opacity(
              opacity: _currentSliderValue / 255,
              child: ColoredBox(
                color: Colors.red,
                child: SizedBox(
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Switch(
                value: offstage,
                onChanged: (value) {
                  setState(() {
                    offstage = value;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            oov.Offstage(
              offstage: offstage,
              child: OffstageColorBox(
                offstage: offstage,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ColoredBox(
              color: Colors.blue,
              child: SizedBox(
                width: 100,
                height: 100,
              ),
            ),
            Switch(
                value: visible,
                onChanged: (value) {
                  setState(() {
                    visible = value;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            Visibility(
                // maintainSize: true,
                // maintainAnimation: true,
                // maintainState: true,
                replacement: Text('隐藏了'),
                visible: visible,
                child: VisibleColorBox(visible: visible)),
            SizedBox(
              height: 20,
            ),
            ColoredBox(
              color: Colors.cyan,
              child: SizedBox(
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 30,
                ),
                Gap(
                  gapSize: 40,
                  color: Colors.black,
                ),
                Container(
                  color: Colors.red,
                  width: 60,
                  height: 60,
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.green,
                      width: 30,
                      height: 40,
                    ),
                    Gap(gapSize: 10),
                    Container(
                      color: Colors.yellow,
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ],
            ),
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

class OffstageColorBox extends StatefulWidget {
  final bool offstage;
  LeafRenderObjectWidget widget;
  Divider divider;
  OffstageColorBox({Key key, this.offstage}) : super(key: key) {}

  @override
  _OffstageColorBoxState createState() => _OffstageColorBoxState();
}

class _OffstageColorBoxState extends State<OffstageColorBox> {
  @override
  void initState() {
    super.initState();
    print('init OffstageColorBox 属性offstage:${widget.offstage}');
  }

  @override
  Widget build(BuildContext context) {
    print('build: OffstageColorBox 属性offstage:${widget.offstage}');

    return ColoredBox(
      color: Colors.green,
      child: SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }
}

class VisibleColorBox extends StatefulWidget {
  final bool visible;

  VisibleColorBox({Key key, this.visible}) : super(key: key) {}

  @override
  _VisibleColorBoxState createState() => _VisibleColorBoxState();
}

class _VisibleColorBoxState extends State<VisibleColorBox> {
  @override
  void initState() {
    super.initState();
    print('init VisibleColorBox 属性visible:${widget.visible}');
  }

  @override
  Widget build(BuildContext context) {
    print('build: VisibleColorBox 属性visible:${widget.visible}');

    return ColoredBox(
      color: Colors.purple,
      child: SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }
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
            maxHeight: MediaQuery.of(context).size.height -
                offset.dy -
                size.height -
                40,
          ),
          child: Material(
            elevation: 4.0,
            child: Card(
              color: LibraryColor.Primary,
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

class StingyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(20.0),
      child: AnimHeightTest(),
    ));
  }
}

class ChildWidgetFromOutside extends StatefulWidget {
  final Widget child1;
  final WidgetBuilder child2Builder;

  const ChildWidgetFromOutside({Key key, this.child1, this.child2Builder})
      : super(key: key);
  @override
  _ChildWidgetFromOutsideState createState() => _ChildWidgetFromOutsideState();
}

class _ChildWidgetFromOutsideState extends State<ChildWidgetFromOutside> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              setState(() {});
            },
            child: Text('刷新'),
          ),
          //一个是widget，一个是WidgetBuilder，为什么刷新的时候只刷新使用方法的呢？
          widget.child1,
          widget.child2Builder(context),
        ],
      ),
    );
  }
}

class AnimHeightTest extends StatefulWidget {
  @override
  _AnimHeightTestState createState() => _AnimHeightTestState();
}

class _AnimHeightTestState extends State<AnimHeightTest>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: 200.milliseconds, vsync: this)
      ..addListener(() {
        setState(() {});
      })
      ..forward();
    offset = Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
        .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return ClipRect(
                  child: Container(
                    color: LibraryColor.Primary,
                    child: Align(
                      alignment: Alignment.topCenter,
                      widthFactor: 1.0,
                      heightFactor: controller.value,
                      child: child,
                    ),
                  ),
                );
                return SlideTransition(
                  position: offset,
                  child: child,
                );
              },
              child: SizedBox(
                width: 400,
                child: Text(
                    '许多年之后，面对行刑队，奥雷良诺·布恩地亚上校将会回想起，他父亲带他去见识冰块的那个遥远的下午。那时的马贡多是一个有二十户人家的村落，用泥巴和芦苇盖的房屋就排列在一条河边。清澈的河水急急地流过，河心那些光滑、洁白的巨石，宛若史前动物留下的巨大的蛋。这块天地如此之新，许多东西尚未命名，提起它们时还须用手指指点点。每年到了三月光景，有一家衣衫褴褛的吉卜赛人家到村子附近来搭帐篷。他们吹笛击鼓，吵吵嚷嚷地向人们介绍最新的发明创造。最初他们带来了磁铁。一个胖乎乎的、留着拉碴胡子、长着一双雀爪般的手的吉卜赛人，自称叫墨尔基阿德斯，他把那玩意儿说成是马其顿的炼金术士们创造的第八奇迹，并当众作了一次惊人的表演。'),
              ),
            ),
          ],
        ),
        RaisedButton(
          onPressed: () {
            if (controller.isCompleted) {
              controller.reverse();
            } else if (controller.isDismissed) {
              controller.forward();
            }
          },
          child: Text(
              '${controller.isCompleted ? '收起' : controller.isDismissed ? '展开' : '动画中'}'),
        ),
        Gap(gapSize: 20),
        DropdownWidget(
          headerTitles: ['地域', '租售', '筛选'],
          contents: [
            '许多年之后，面对行刑队，奥雷良诺·布恩地亚上校将会回想起，他父亲带他去见识冰块的那个遥远的下午。那时的马贡多是一个有二十户人家的村落，用泥巴和芦苇盖的房屋就排列在一条河边。清澈的河水急急地流过，河心那些光滑、洁白的巨石，宛若史前动物留下的巨大的蛋。这块天地如此之新，许多东西尚未命名，提起它们时还须用手指指点点。每年到了三月光景，有一家衣衫褴褛的吉卜赛人家到村子附近来搭帐篷。他们吹笛击鼓，吵吵嚷嚷地向人们介绍最新的发明创造。最初他们带来了磁铁。一个胖乎乎的、留着拉碴胡子、长着一双雀爪般的手的吉卜赛人，自称叫墨尔基阿德斯，他把那玩意儿说成是马其顿的炼金术士们创造的第八奇迹，并当众作了一次惊人的表演。',
            '“地球是圆的，象一个橘子一样。”',
            '乌苏拉再也忍不住了。“你要发神经病，就一个人去发，”她吼叫着，“别拿你那吉卜赛式的怪想法往孩子们脑袋里灌！”霍塞·阿卡迪奥·布恩地亚听后无动于衷。他妻子一气之下把他的观象仪摔在地上打得粉碎，可是他没有被妻子的狂怒吓退，重新造了一架。他还把村里的男人都召集到自己的房间里，用谁也听不懂的理论向他们论证：只要一直朝东方航行，最后就能返回出发地点。全村的人都认为霍塞·阿卡迪奥·布恩地亚已经精神失常。这时，墨尔基阿德斯来了，这才把事情搞清楚，他当众夸赞霍塞·阿卡迪奥·布恩地亚的才智，说他仅凭天文估算便创造了一种理论。虽然这种理论在马贡多至今尚无人知晓，但已经为实践所证明。为了表示钦佩，他赠给霍塞·阿卡迪奥·布恩地亚一份礼品：一间炼金试验室。这对村子的未来产生了决定性的影响。',
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () {
                Toast.show(context,
                    message: 'topLeft', alignment: Alignment.topLeft);
              },
              child: Text('topLeft'),
            ),
            RaisedButton(
              onPressed: () {
                Toast.show(context,
                    message: 'topCenter', alignment: Alignment.topCenter);
              },
              child: Text('topCenter'),
            ),
            RaisedButton(
              onPressed: () {
                Toast.show(context,
                    message: 'topRight', alignment: Alignment.topRight);
              },
              child: Text('topRight'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () {
                Toast.show(context,
                    message: 'centerLeft', alignment: Alignment.centerLeft);
              },
              child: Text('centerLeft'),
            ),
            RaisedButton(
              onPressed: () {
                Toast.show(context,
                    message: 'center', alignment: Alignment.center);
              },
              child: Text('center'),
            ),
            RaisedButton(
              onPressed: () {
                Toast.show(context,
                    message: 'centerRight', alignment: Alignment.centerRight);
              },
              child: Text('centerRight'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () {
                Toast.show(context,
                    message: 'bottomLeft', alignment: Alignment.bottomLeft);
              },
              child: Text('bottomLeft'),
            ),
            RaisedButton(
              onPressed: () {
                Toast.show(context,
                    message: 'bottomCenter', alignment: Alignment.bottomCenter);
              },
              child: Text('bottomCenter'),
            ),
            RaisedButton(
              onPressed: () {
                Toast.show(context,
                    message: 'bottomRight', alignment: Alignment.bottomRight);
              },
              child: Text('bottomRight'),
            ),
          ],
        ),
      ],
    );
  }
}

class InheritedThemeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(fontSize: 48, color: Colors.red),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext _) {
                    // InheritedTheme.captureAll() saves references to themes that
                    // are found above the context provided to this widget's build
                    // method, notably the DefaultTextStyle defined in MyApp. The
                    // context passed to the MaterialPageRoute's builder is not used,
                    // because its ancestors are above MyApp's home.
                    return InheritedTheme.captureAll(
                        context,
                        Container(
                          alignment: Alignment.center,
                          color: Theme.of(context).colorScheme.surface,
                          child: Text('Hello World'),
                        ));
                  },
                ),
              );
            },
            child: Center(child: Text('Tap Here'))));
  }
}

class CountValue extends ValueNotifier<int> {
  CountValue(int value) : super(value);
}

class CountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int value = CountInheritedNotifier.of(context).notifier.value;
    return Text('$value');
  }
}

class NameWidgetTest extends StatefulWidget {
  final Widget child;

  const NameWidgetTest({Key key, this.child}) : super(key: key);
  @override
  _NameWidgetTestState createState() => _NameWidgetTestState();
}

class _NameWidgetTestState extends State<NameWidgetTest> {
  String firstName = 'FaKen';
  String lastName = 'Lin';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameInheritedWidget(
          firstName: firstName,
          lastName: lastName,
          child: widget.child,
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              firstName = 'FaKen${Random().nextInt(100)}';
            });
          },
          child: Text('名字'),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              lastName = 'Lin${Random().nextInt(100)}';
            });
          },
          child: Text('姓氏'),
        ),
      ],
    );
  }
}

class CountNotifierTest extends StatelessWidget {
  final Widget child;
  final ValueNotifier valueNotifier;

  const CountNotifierTest({Key key, this.valueNotifier, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CountInheritedNotifier(
          child: child,
          notifier: valueNotifier,
        ),
        RaisedButton(
          onPressed: () {
            valueNotifier.value = Random().nextInt(100);
          },
          child: Text('随机值'),
        ),
      ],
    );
  }
}

class PeopleName extends StatelessWidget {
  final bool first;
  const PeopleName({Key key, this.first}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String keyName = first ? 'firstName' : 'lastName';
    print('重绘:$keyName');
    final data = NameInheritedWidget.of(context, dependency: keyName);
    return Text('${first ? data.firstName : data.lastName}');
  }
}

class Stingy extends SingleChildRenderObjectWidget {
  Stingy({Widget child}) : super(child: child);
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStingy();
  }
}

class RenderStingy extends RenderShiftedBox {
  RenderStingy() : super(null);

  @override
  void performLayout() {
    child.layout(
        BoxConstraints(
            minHeight: 0.0,
            maxHeight: constraints.minHeight,
            minWidth: 0.0,
            maxWidth: constraints.minWidth),
        parentUsesSize: true);

    final BoxParentData childParentData = child.parentData;
    childParentData.offset = Offset(
      this.constraints.maxWidth - child.size.width,
      this.constraints.maxHeight - child.size.height,
    );

    size = Size(this.constraints.maxWidth, constraints.maxHeight);
  }
}

class Gap extends LeafRenderObjectWidget {
  const Gap({Key key, this.gapSize, this.color}) : super(key: key);
  final double gapSize;
  final Color color;
  @override
  RenderObject createRenderObject(BuildContext context) =>
      RenderGap(gapSize: gapSize, color: color);

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) {
    renderObject
      ..gapSize = gapSize
      ..color = color;
  }
}

class RenderGap extends RenderBox {
  RenderGap({double gapSize, Color color})
      : _gapSize = gapSize,
        _color = color,
        super();

  double get gapSize => _gapSize;
  double _gapSize;
  set gapSize(double value) {
    if (_gapSize == value) {
      return;
    }
    _gapSize = value;
    markNeedsLayout();
  }

  Color get color => _color;
  Color _color;
  set color(Color value) {
    if (_color == value) {
      return;
    }
    _color = value;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    final parent = this.parent;
    if (parent is RenderFlex) {
      if (parent.direction == Axis.horizontal) {
        size = constraints.constrain(Size(_gapSize, 10));
      } else {
        size = constraints.constrain(Size(10, _gapSize));
      }
    } else {
      throw FlutterError('Gap must be used inside a Flex Widget');
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // print('间隔颜色是:$color,大小:${offset & size}');
    if (color != null) {
      final Paint paint = Paint()..color = color;
      context.canvas.drawRect(offset & size, paint);
    }
  }
}

class SliverGap extends LeafRenderObjectWidget {
  const SliverGap({Key key, this.extent, this.color}) : super(key: key);
  final double extent;
  final Color color;
  @override
  RenderObject createRenderObject(BuildContext context) =>
      RenderSliverGap(extent: extent, color: color);

  @override
  void updateRenderObject(BuildContext context, RenderSliverGap renderObject) {
    renderObject
      ..extent = extent
      ..color = color;
  }
}

class RenderSliverGap extends RenderSliver {
  RenderSliverGap({double extent, Color color})
      : _extent = extent,
        _color = color;

  double get extent => _extent;
  double _extent;
  set extent(double value) {
    if (_extent == value) {
      return;
    }
    _extent = value;
    markNeedsLayout();
  }

  Color get color => _color;
  Color _color;
  set color(Color value) {
    if (_color == value) {
      return;
    }
    _color = color;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    final double paintExtent =
        calculatePaintOffset(constraints, from: 0, to: extent);
    final double cacheExtent =
        calculateCacheOffset(constraints, from: 0, to: extent);

    geometry = SliverGeometry(
      scrollExtent: extent,
      paintExtent: paintExtent,
      cacheExtent: cacheExtent,
      maxPaintExtent: extent,
      hitTestExtent: paintExtent,
      hasVisualOverflow: extent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (color != null) {
      final Paint paint = Paint()..color = color;
      final Size size = constraints
          .asBoxConstraints(
              minExtent: geometry.paintExtent, maxExtent: geometry.paintExtent)
          .constrain(Size.zero);
      context.canvas.drawRect(offset & size, paint);
    }
  }
}

class Exploder extends LeafRenderObjectWidget {
  Exploder({Key key, this.color, this.radius}) : super(key: key);
  final Color color;
  final double radius;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderExploder(color: color, radius: radius);
  }

  @override
  void updateRenderObject(BuildContext context, RenderExploder renderObject) {
    renderObject
      ..color = color
      ..radius = radius;
  }
}

class RenderExploder extends RenderBox {
  RenderExploder({Color color, double radius})
      : _color = color,
        _radius = radius;

  Color get color => _color;
  Color _color;
  set color(Color value) {
    if (_color == value) {
      return;
    }
    _color = value;
    markNeedsPaint();
  }

  double get radius => _radius;
  double _radius;
  set radius(double value) {
    if (_radius == value) {
      return;
    }
    _radius = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    size = constraints.constrain(Size(radius * 2, radius * 2));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas
        .drawCircle(size.center(offset), radius, Paint()..color = color);
  }
}

class ColorInheritedWidget extends InheritedWidget {
  const ColorInheritedWidget({Key key, this.color, Widget child})
      : super(key: key, child: child);
  final Color color;

  static ColorInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorInheritedWidget>();
  }

  @override
  bool updateShouldNotify(ColorInheritedWidget oldWidget) =>
      color != oldWidget.color;
}

class NameInheritedWidget extends InheritedModel<String> {
  const NameInheritedWidget(
      {Key key, this.firstName, this.lastName, Widget child})
      : super(key: key, child: child);
  final String firstName;
  final String lastName;
  @override
  bool updateShouldNotify(NameInheritedWidget oldWidget) {
    return firstName != oldWidget.firstName || lastName != oldWidget.lastName;
  }

  @override
  bool updateShouldNotifyDependent(
      NameInheritedWidget oldWidget, Set<String> dependencies) {
    return dependencies.contains('firstName') &&
            oldWidget.firstName != firstName ||
        dependencies.contains('lastName') && oldWidget.lastName != lastName;
  }

  static NameInheritedWidget of(BuildContext context, {String dependency}) {
    return context.dependOnInheritedWidgetOfExactType<NameInheritedWidget>(
        aspect: dependency);
  }
}

class CountInheritedNotifier extends InheritedNotifier<ValueNotifier<int>> {
  CountInheritedNotifier({Key key, ValueNotifier<int> notifier, Widget child})
      : super(key: key, child: child, notifier: notifier);

  static CountInheritedNotifier of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}
