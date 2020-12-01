import 'package:flutter/material.dart';
import 'package:time/time.dart';

class Toast {
  static void show(
    BuildContext context, {
    String message,
    Duration duration,
    Alignment alignment = Alignment.center,
    // false表示alignment相对于全页面，true表示相对于当前页面
    bool relativePage = false,
  }) {
    RenderBox renderBox = context.findRenderObject();
    Offset globalOffset = renderBox.localToGlobal(Offset.zero);

    double left;
    double right;

    int x = alignment.x.round();
    int y = alignment.y.round();
    switch (x) {
      case -1:
      case 0:
        left = globalOffset.dx;
        right = 0;
        break;
      case 1:
        left = 0;
        right = MediaQuery.of(context).size.width -
            renderBox.size.width -
            globalOffset.dx;
        break;
    }

    // double top;
    // double bottom;
    // switch (y) {
    //   case -1:
    //     top = 0;
    //     break;
    //   case 0:
    //     top = 0;
    //     bottom = 0;
    //     break;
    //   case 1:
    //     bottom = 0;
    //     break;
    // }

    Widget buildChild() {
      return Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black87.withOpacity(0.7),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            '$message',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    OverlayEntry entry = OverlayEntry(builder: (context) {
      return Positioned.fill(
        left: relativePage ? left : 0,
        right: relativePage ? right : 0,
        // top: relativePage ? top : 0,
        // bottom: relativePage ? bottom : 0,
        child: Align(alignment: alignment, child: buildChild()),
      );
    });
    Overlay.of(context).insert(entry);
    Future.delayed(duration ?? 1.seconds, () => entry.remove());
  }
}
