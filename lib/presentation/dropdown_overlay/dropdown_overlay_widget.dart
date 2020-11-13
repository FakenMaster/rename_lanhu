import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rename_lanhu/infrasture/util/util.dart';
import 'package:time/time.dart';
import 'package:stringx/stringx.dart';

/// TODO: how to update overlay layout without removing overlay?
class DropdownWidget extends StatelessWidget {
  final List<String> headerTitles;
  final List<String> contents;
  const DropdownWidget(
      {Key key, @required this.headerTitles, @required this.contents})
      : assert(headerTitles != null),
        assert(contents != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OverlayStatusNotifier(),
      child:
          _DropdownHeaderWidget(headerTitles: headerTitles, contents: contents),
    );
  }
}

class _DropdownHeaderWidget extends StatefulWidget {
  final List<String> headerTitles;
  final List<String> contents;

  const _DropdownHeaderWidget(
      {Key key, @required this.headerTitles, @required this.contents})
      : assert(headerTitles != null),
        assert(contents != null),
        super(key: key);

  @override
  _DropdownHeaderWidgetState createState() => _DropdownHeaderWidgetState();
}

class _DropdownHeaderWidgetState extends State<_DropdownHeaderWidget> {
  GlobalKey dropdownKey;
  OverlayEntry dropdownEntry;
  int overlayIndex;

  @override
  void initState() {
    super.initState();
    dropdownKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      key: dropdownKey,
      children: widget.headerTitles
          .mapWithIndex((index, title) => Expanded(
                child: RaisedButton(
                  onPressed: () {
                    toggleOverlay(index);
                  },
                  child: Text(title),
                ),
              ))
          .toList(),
    );
  }

  void toggleOverlay(final int index) {
    OverlayStatusNotifier notifier =
        Provider.of<OverlayStatusNotifier>(context, listen: false);
    num delayMilliseconds = 0;
    if (notifier.value == true) {
      /// 已经有弹出框，先隐藏
      if (index == overlayIndex) {
        /// 同一个header点击
        overlayIndex = null;
        notifier.value = false;
        return;
      }

      /// 不同的header点击:加下面两行是为了不要收起的效果了
      dropdownEntry.remove();
      dropdownEntry = null;

      delayMilliseconds = 0;
    }
    overlayIndex = index;
    Future.delayed(delayMilliseconds.milliseconds, showOverlay);
  }

  void showOverlay() {
    OverlayStatusNotifier notifier =
        Provider.of<OverlayStatusNotifier>(context, listen: false);
    final RenderBox dropdownBox =
        dropdownKey.currentContext.findRenderObject() as RenderBox;

    final Offset dropdownPosition = dropdownBox.localToGlobal(Offset.zero);
    dropdownEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: dropdownPosition.dx,
          right: MediaQuery.of(context).size.width -
              dropdownPosition.dx -
              dropdownBox.size.width,
          top: dropdownPosition.dy + dropdownBox.size.height,
          child: ChangeNotifierProvider.value(
            value: notifier,
            child: OverlayWidget(
              content: widget.contents[overlayIndex],
              dismissCallback: () {
                dropdownEntry.remove();
                dropdownEntry = null;
              },
            ),
          ),
        );
      },
    );

    notifier.value = true;
    Overlay.of(context).insert(dropdownEntry);
  }
}

class OverlayWidget extends StatefulWidget {
  final VoidCallback dismissCallback;
  final String content;
  const OverlayWidget(
      {Key key, @required this.dismissCallback, @required this.content})
      : super(key: key);
  @override
  _OverlayWidgetState createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: 200.milliseconds, vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          widget.dismissCallback?.call();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OverlayStatusNotifier>(
      builder: (context, value, child) {
        if (value.value ?? true) {
          controller.forward();
        } else {
          controller.reverse();
        }
        return child;
      },
      child: AnimatedBuilder(
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
        },
        child: SizedBox(
          // width: double.infinity,
          child: Text(
            widget.content,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class OverlayStatusNotifier extends ValueNotifier<bool> {
  OverlayStatusNotifier() : super(false);
}
