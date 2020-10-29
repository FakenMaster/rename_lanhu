import 'package:flutter/material.dart';
import 'gzx_dropdown_menu_controller.dart';

typedef OnItemTap<T> = void Function(T value);

class GZXDropdownHeader extends StatefulWidget {
  final Color backgroundColor;
  final double borderWidth;
  final Color borderColor;
  final EdgeInsets titlePadding;
  final TextStyle style;
  final TextStyle dropdownStyle;
  final double iconSize;
  final Color iconColor;
  final Color iconDropdownColor;

//  final List<String> menuStrings;
  final double height;
  final double dividerHeight;
  final Color dividerColor;
  final GZXDropdownMenuController controller;
  final OnItemTap onItemTap;
  final List<GZXDropdownHeaderItem> items;
  final GlobalKey stackKey;

  GZXDropdownHeader({
    Key key,
    @required this.items,
    @required this.controller,
    @required this.stackKey,
    this.style = const TextStyle(color: Color(0xFF333333), fontSize: 14),
    this.dropdownStyle,
    this.height = 40,
    this.iconColor = const Color(0xFF333333),
    this.iconDropdownColor,
    this.iconSize = 20,
    this.borderWidth = 1,
    this.borderColor = const Color(0xFFeeede6),
    this.dividerHeight = 20,
    this.dividerColor = const Color(0xFFeeede6),
    this.onItemTap,
    this.backgroundColor = Colors.white,
    this.titlePadding,
  }) : super(key: key);

  @override
  _GZXDropdownHeaderState createState() => _GZXDropdownHeaderState();
}

class _GZXDropdownHeaderState extends State<GZXDropdownHeader>
    with SingleTickerProviderStateMixin {
  bool _isShowDropDownItemWidget = false;
  GlobalKey _keyDropdownHeader = GlobalKey();

  TextStyle dropdownStyle;
  Color iconDropdownColor;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    dropdownStyle = widget.dropdownStyle ??
        TextStyle(color: Theme.of(context).primaryColor, fontSize: 14);
    iconDropdownColor =
        widget.iconDropdownColor ?? Theme.of(context).primaryColor;

    return Container(
      key: _keyDropdownHeader,
      height: widget.height,
      width: double.infinity,
      padding: widget.titlePadding ?? EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        border:
            Border.all(color: widget.borderColor, width: widget.borderWidth),
      ),
      child: Row(
        children: widget.items.map<Widget>((item) {
          return _menu(item);
        }).toList(),
      ),
    );
  }

  _menu(GZXDropdownHeaderItem item) {
    int index = widget.items.indexOf(item);
    int menuIndex = widget.controller.menuIndex;
    _isShowDropDownItemWidget = index == menuIndex && widget.controller.isShow;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();

          final RenderBox overlay =
              widget.stackKey.currentContext.findRenderObject();

          final RenderBox dropDownItemRenderBox =
              _keyDropdownHeader.currentContext.findRenderObject();

          var position = dropDownItemRenderBox.localToGlobal(Offset.zero,
              ancestor: overlay);
          var size = dropDownItemRenderBox.size;

          widget.controller.dropdownHeaderHeight = size.height + position.dy;

          if (widget.controller.isShow) {
            widget.controller.hide();
          } else {
            widget.controller.show(index);
          }
          if (widget.onItemTap != null) {
            widget.onItemTap(index);
          }
          if (mounted) {
            setState(() {});
          }
        },
        child: Container(
            color: widget.backgroundColor,
            height: widget.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          child: Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: _isShowDropDownItemWidget
                            ? dropdownStyle
                            : widget.style,
                      )),
                      Icon(
                        !_isShowDropDownItemWidget
                            ? item.iconData ?? Icons.arrow_drop_down
                            : item.iconData ?? Icons.arrow_drop_up,
                        color: _isShowDropDownItemWidget
                            ? iconDropdownColor
                            : widget.iconColor,
                        size: item.iconSize ?? widget.iconSize,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class GZXDropdownHeaderItem {
  final String title;
  final IconData iconData;
  final double iconSize;

  GZXDropdownHeaderItem(
    this.title, {
    this.iconData,
    this.iconSize,
  });
}
