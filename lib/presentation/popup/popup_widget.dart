import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'popup_base_widget.dart';

typedef MenuSelectCallback = void Function(int index);
typedef ContentSelectCallback = void Function(int index);
typedef IndexedSelectedWidgetBuilder = Widget Function(
    BuildContext context, int index, bool selected);

class PopupWidget extends PopupBaseWidget {
  PopupWidget.listBuilder({
    Key key,
    @required List<String> titles,
    @required List<List<String>> contents,
    List<double> contentHeights,
    List<IndexedSelectedWidgetBuilder> itemBuilders,
    MenuSelectCallback onMenuSelect,
    ContentSelectCallback onContentSelect,
    Color selectMenuColor,
    Color unselectMenuColor,
    Duration duration,
    double contentMarginBottom,
  })  : assert(contentMarginBottom == null || contentMarginBottom >= 0),
        super(
          key: key,
          titles: titles,
          contents: contents,
          contentHeights: contentHeights,
          itemBuilders:itemBuilders,
          onMenuSelect: onMenuSelect,
          onContentSelect: onContentSelect,
          selectMenuColor: selectMenuColor,
          unselectMenuColor: unselectMenuColor,
          duration: duration,
          contentMarginBottom: contentMarginBottom,
        );
}

