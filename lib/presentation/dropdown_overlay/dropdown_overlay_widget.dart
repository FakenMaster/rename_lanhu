import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rename_lanhu/infrasture/util/util.dart';
import 'package:time/time.dart';
import 'package:stringx/stringx.dart';
/// TODO: how to update overlay layout without removing overlay?
class DropdownWidget extends StatelessWidget {
  final List<String> headerTitles;

  const DropdownWidget({Key key, @required this.headerTitles})
      : assert(headerTitles != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OverlayStatusNotifier(),
      child: _DropdownHeaderWidget(headerTitles: headerTitles),
    );
  }
}

class _DropdownHeaderWidget extends StatefulWidget {
  final List<String> headerTitles;

  const _DropdownHeaderWidget({Key key, @required this.headerTitles})
      : assert(headerTitles != null),
        super(key: key);

  @override
  _DropdownHeaderWidgetState createState() => _DropdownHeaderWidgetState();
}

class _DropdownHeaderWidgetState extends State<_DropdownHeaderWidget> {
  GlobalKey dropdownKey;
  OverlayEntry dropdownEntry;
  int index;

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
                    showOverlay(index);
                  },
                  child: Text(title),
                ),
              ))
          .toList(),
    );
  }

  void showOverlay(final int index) {
    OverlayStatusNotifier notifier =
        Provider.of<OverlayStatusNotifier>(context, listen: false);
    if (notifier.value == true) {
      notifier.value = false;
      return;
    }

    final RenderBox dropdownBox =
        dropdownKey.currentContext.findRenderObject() as RenderBox;

    final Offset dropdownPosition = dropdownBox.localToGlobal(Offset.zero);

    dropdownEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: dropdownPosition.dx,
          top: dropdownPosition.dy + dropdownBox.size.height,
          child: ChangeNotifierProvider.value(
            value: notifier,
            child: OverlayWidget(
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
  const OverlayWidget({Key key, @required this.dismissCallback})
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
          width: 400,
          child: Text(
            '许多年之后，面对行刑队，奥雷良诺·布恩地亚上校将会回想起，他父亲带他去见识冰块的那个遥远的下午。那时的马贡多是一个有二十户人家的村落，用泥巴和芦苇盖的房屋就排列在一条河边。清澈的河水急急地流过，河心那些光滑、洁白的巨石，宛若史前动物留下的巨大的蛋。这块天地如此之新，许多东西尚未命名，提起它们时还须用手指指点点。每年到了三月光景，有一家衣衫褴褛的吉卜赛人家到村子附近来搭帐篷。他们吹笛击鼓，吵吵嚷嚷地向人们介绍最新的发明创造。最初他们带来了磁铁。一个胖乎乎的、留着拉碴胡子、长着一双雀爪般的手的吉卜赛人，自称叫墨尔基阿德斯，他把那玩意儿说成是马其顿的炼金术士们创造的第八奇迹，并当众作了一次惊人的表演。',
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
