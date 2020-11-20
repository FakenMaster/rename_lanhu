import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rename_lanhu/infrasture/util/util.dart';
import 'package:stringx/stringx.dart';
import 'package:time/time.dart';

typedef MenuSelectCallback = void Function(int index);
typedef ContentSelectCallback = void Function(int index);


class PopupWidget extends StatefulWidget {
  PopupWidget.listBuilder({
    Key key,
    @required this.titles,
    @required this.contents,
    List<double> contentHeights,
    this.onMenuSelect,
    this.onContentSelect,
    Color selectMenuColor,
    Color unselectMenuColor,
    this.duration,
    double contentMarginBottom,
  })  : assert(contentMarginBottom == null || contentMarginBottom >= 0),
        contentHeights = ListX.copyList<double>(contentHeights, titles.length),
        selectMenuColor = selectMenuColor ?? LibraryColor.Primary,
        unselectMenuColor = unselectMenuColor ?? Colors.black87,
        contentMarginBottom = contentMarginBottom ?? 50,
        super(key: key);

  // 标题
  final List<String> titles;
  // 内容
  final List<List<String>> contents;
  // 每一项高度, null就是随内容变化
  final List<double> contentHeights;

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
    _popupOverlayEntry?.remove();
    _popupOverlayEntry = null;
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
        final contentHeight = widget.contentHeights[selectMenuIndex];
        double limitHeight = (screenHeight -
                globalOffset.dy -
                renderBox.size.height -
                widget.contentMarginBottom)
            .clamp(0, screenHeight);
        final double minHeight = (contentHeight ?? 0).clamp(0, limitHeight);
        final double maxHeight =
            (contentHeight ?? limitHeight).clamp(0, limitHeight);
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
              child: GestureDetector(
                // 防止点击content的空白区域使得弹出框消失
                onTap: () {},
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: minHeight,
                    maxHeight: maxHeight,
                  ),
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
          ),
        );
      },
    );

    Overlay.of(context).insert(_popupOverlayEntry);
  }
}

class PopupContentWidget extends StatefulWidget {
  final List<String> contents;
  final int selectIndex;
  final Function(int index, double scrollOffset) onContentSelect;
  final Duration duration;
  final double scrollOffset;
  const PopupContentWidget({
    Key key,
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
        child: Scrollbar(
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
      ),
    );
  }
}
