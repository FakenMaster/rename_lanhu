import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rename_lanhu/infrasture/util/util.dart';
import 'package:stringx/stringx.dart';
import 'package:time/time.dart';

/// TODO:复杂的界面实现，可以传入自定义的ListView itemBuilder，或者非ListView的Widget。
class PopupPage extends StatefulWidget {
  @override
  _PopupPageState createState() => _PopupPageState();
}

class _PopupPageState extends State<PopupPage> {
  List<String> titles;
  List<List<String>> contents;
  int selectMenuIndex;
  List<String> selectDataList;

  @override
  void initState() {
    super.initState();
    titles = ['半马', '全马', '超马100KM'];
    contents = [
      [
        '02:10:00',
        '01:55:10',
        '01:50:32',
        '01:49:03',
        '01:30:01',
        '01:08:24',
        '00:57:57',
        '02:10:00',
        '01:55:10',
        '01:50:32',
        '01:49:03',
        '01:30:01',
        '01:08:24',
        '00:57:57',
        '02:10:00',
        '01:55:10',
        '01:50:32',
        '01:49:03',
        '01:30:01',
        '01:08:24',
        '00:57:57',
        '02:10:00',
        '01:55:10',
        '01:50:32',
        '01:49:03',
        '01:30:01',
        '01:08:24',
        '00:57:57',
        '02:10:00',
        '01:55:10',
        '01:50:32',
        '01:49:03',
        '01:30:01',
        '01:08:24',
        '00:57:57'
      ],
      ['04:30:05', '03:57:49', '03:21:00', '02:58:58'],
      ['12:10:47', '10:00:00', '09:43:32', '06:06:06', '05:05:05']
    ];
    selectDataList = List.filled(3, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹出框'),
      ),
      body: Column(
        children: [
          PopupWidget(
            titles: titles,
            contents: contents,
            onMenuSelect: (index) {
              setState(() {
                selectMenuIndex = index;
              });
            },
            onContentSelect: (index) {
              setState(() {
                selectDataList[selectMenuIndex] =
                    contents[selectMenuIndex][index];
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'menuIndex: $selectMenuIndex\n' +
                    selectDataList
                        .mapWithIndex(
                            (index, value) => '${titles[index]}: $value')
                        .reduce((value, element) => '$value\n$element'),
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

typedef MenuSelectCallback = void Function(int index);
typedef ContentSelectCallback = void Function(int index);

class PopupWidget extends StatefulWidget {
  PopupWidget({
    Key key,
    @required this.titles,
    @required this.contents,
    this.onMenuSelect,
    this.onContentSelect,
    Color selectMenuColor,
    Color unselectMenuColor,
    this.duration,
    double contentMarginBottom,
  })  : selectMenuColor = selectMenuColor ?? LibraryColor.Primary,
        unselectMenuColor = unselectMenuColor ?? Colors.black87,
        contentMarginBottom = contentMarginBottom ?? 50,
        super(key: key);

  final List<String> titles;
  final List<List<String>> contents;
  final MenuSelectCallback onMenuSelect;
  final ContentSelectCallback onContentSelect;

  final Color selectMenuColor;
  final Color unselectMenuColor;
  final Duration duration;
  // 内容超过一屏时距底部的距离
  final double contentMarginBottom;
  @override
  _PopupWidgetState createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget> {
  int selectMenuIndex;
  Map<int, int> selectContentMap = {};
  Map<int, double> scrollOffsets = {};
  OverlayEntry _popupOverlayEntry;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _popupOverlayEntry.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: widget.titles.mapWithIndex((index, value) {
      bool selected = selectMenuIndex == index;
      return Expanded(
        child: Material(
          child: InkWell(
            onTap: () {
              setState(() {
                if (selected) {
                  selectMenuIndex = null;
                } else {
                  selectMenuIndex = index;
                }
                widget.onMenuSelect(selectMenuIndex);
                showPopupOverlay(context);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$value',
                    style: TextStyle(
                        fontSize: 20,
                        color: selected
                            ? widget.selectMenuColor
                            : widget.unselectMenuColor),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  RotatedBox(
                    quarterTurns: selected ? 2 : 0,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: selected
                          ? widget.selectMenuColor
                          : widget.unselectMenuColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList());
  }

  void showPopupOverlay(BuildContext context) {
    _popupOverlayEntry?.remove();
    _popupOverlayEntry = null;
    if (selectMenuIndex == null) {
      return;
    }

    RenderBox renderBox = context.findRenderObject();
    Offset globalOffset = renderBox.localToGlobal(Offset.zero);
    _popupOverlayEntry = OverlayEntry(
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        double maxHeight = (screenHeight -
                globalOffset.dy -
                renderBox.size.height -
                widget.contentMarginBottom)
            .clamp(0, screenHeight);

        return Positioned.fill(
          left: globalOffset.dx,
          top: globalOffset.dy + renderBox.size.height,
          child: GestureDetector(
            onTap: () {
              selectMenuIndex = null;
              widget.onMenuSelect(selectMenuIndex);
              showPopupOverlay(context);
            },
            child: Container(
              color: Colors.grey.withOpacity(0.7),
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: maxHeight),
                child: PopupContentWidget(
                  contents: widget.contents[selectMenuIndex],
                  selectIndex: selectContentMap[selectMenuIndex],
                  duration: widget.duration,
                  scrollOffset: scrollOffsets[selectMenuIndex],
                  onContentSelect: (index, scrollOffset) {
                    scrollOffsets[selectMenuIndex] = scrollOffset;
                    selectContentMap[selectMenuIndex] = index;
                    widget.onContentSelect(index);
                    selectMenuIndex = null;
                    widget.onMenuSelect(selectMenuIndex);
                    showPopupOverlay(context);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_popupOverlayEntry);
  }
}

class PopupContentWidget extends StatefulWidget {
  // final VoidCallback onDismiss;
  final List<String> contents;
  final int selectIndex;
  final Function(int index, double scrollOffset) onContentSelect;
  final Duration duration;
  final double scrollOffset;
  const PopupContentWidget({
    Key key,
    // @required this.onDismiss,
    @required this.contents,
    @required this.selectIndex,
    this.onContentSelect,
    this.duration,
    @required this.scrollOffset,
  }) : super(key: key);
  @override
  _PopupContentWidgetState createState() => _PopupContentWidgetState();
}

class _PopupContentWidgetState extends State<PopupContentWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  int selectIndex;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    selectIndex = widget.selectIndex;
    _scrollController =
        ScrollController(initialScrollOffset: widget.scrollOffset ?? 0);
    controller = AnimationController(
        duration: widget.duration ?? 0.milliseconds, vsync: this);
    animation = Tween<double>(begin: 0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipRect(
          child: Container(
            color: Colors.white,
            child: Align(
              alignment: Alignment.topCenter,
              widthFactor: 1.0,
              heightFactor: animation.value,
              child: child,
            ),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (context, index) {
            final String content = widget.contents[index];
            final bool selected = index == selectIndex;
            return Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectIndex = index;
                    widget.onContentSelect(index, _scrollController.offset);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '$content',
                    style: TextStyle(
                      fontSize: 16,
                      color: selected ? LibraryColor.Primary : Colors.black54,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: widget.contents.length,
        ),
      ),
    );
  }
}
