import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'popup_base_widget.dart';

typedef MenuSelectCallback = void Function(int index);
typedef ContentSelectCallback = void Function(int index);
typedef IndexedSelectedWidgetBuilder = Widget Function(
    BuildContext context, int index, bool selected);

class PopupWidget extends PopupBaseWidget {
  PopupWidget({
    Key key,
    @required List<String> titles,
    @required List<List<String>> contents,
    List<double> contentHeights,
    List<WidgetBuilder> contentBuilders,
    List<IndexedSelectedWidgetBuilder> itemBuilders,
    MenuSelectCallback onMenuSelect,
    ContentSelectCallback onContentSelect,
    Color selectMenuColor,
    Color unselectMenuColor,
    Duration duration,
    double contentMarginBottom,
  })  : assert(contentBuilders != null || itemBuilders != null),
        assert(contentMarginBottom == null || contentMarginBottom >= 0),
        super(
          key: key,
          titles: titles,
          contents: contents,
          contentHeights: contentHeights,
          contentBuilders: contentBuilders,
          itemBuilders: itemBuilders,
          onMenuSelect: onMenuSelect,
          onContentSelect: onContentSelect,
          selectMenuColor: selectMenuColor,
          unselectMenuColor: unselectMenuColor,
          duration: duration,
          contentMarginBottom: contentMarginBottom,
        );

  PopupWidget.builer({
    Key key,
    @required List<String> titles,
    @required List<List<String>> contents,
    List<double> contentHeights,
    @required List<IndexedSelectedWidgetBuilder> itemBuilders,
    MenuSelectCallback onMenuSelect,
    ContentSelectCallback onContentSelect,
    Color selectMenuColor,
    Color unselectMenuColor,
    Duration duration,
    double contentMarginBottom,
  })  : assert(itemBuilders != null),
        assert(contentMarginBottom == null || contentMarginBottom >= 0),
        super(
          key: key,
          titles: titles,
          contents: contents,
          contentHeights: contentHeights,
          itemBuilders: itemBuilders,
          onMenuSelect: onMenuSelect,
          onContentSelect: onContentSelect,
          selectMenuColor: selectMenuColor,
          unselectMenuColor: unselectMenuColor,
          duration: duration,
          contentMarginBottom: contentMarginBottom,
        );

  PopupWidget.custom({
    Key key,
    @required List<String> titles,
    @required List<List<String>> contents,
    List<double> contentHeights,
    @required List<WidgetBuilder> contentBuilders,
    MenuSelectCallback onMenuSelect,
    ContentSelectCallback onContentSelect,
    Color selectMenuColor,
    Color unselectMenuColor,
    Duration duration,
    double contentMarginBottom,
  })  : assert(contentBuilders != null),
        assert(contentMarginBottom == null || contentMarginBottom >= 0),
        super(
          key: key,
          titles: titles,
          contents: contents,
          contentHeights: contentHeights,
          contentBuilders: contentBuilders,
          onMenuSelect: onMenuSelect,
          onContentSelect: onContentSelect,
          selectMenuColor: selectMenuColor,
          unselectMenuColor: unselectMenuColor,
          duration: duration,
          contentMarginBottom: contentMarginBottom,
        );
}
