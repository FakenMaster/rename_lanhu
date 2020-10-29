import 'package:flutter/material.dart';

import 'gzx_dropdown_menu_controller.dart';

class GZXDropdownMenuBuilder {
  final Widget dropdownWidget;
  final double dropdownHeight;

  GZXDropdownMenuBuilder(
      {@required this.dropdownWidget, @required this.dropdownHeight});
}

class GZXDropdownMenu extends StatefulWidget {
  final GZXDropdownMenuController controller;
  final List<GZXDropdownMenuBuilder> menus;
  final int animationMilliseconds;

  const GZXDropdownMenu(
      {Key key,
      @required this.controller,
      @required this.menus,
      this.animationMilliseconds = 500})
      : super(key: key);

  @override
  _GZXDropdownMenuState createState() => _GZXDropdownMenuState();
}

class _GZXDropdownMenuState extends State<GZXDropdownMenu>
    with SingleTickerProviderStateMixin {
  bool _isShowDropdownItemWidget = false;
  bool _isShowMask = false;
  bool _isControllerDisposed = false;
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_onController);
    _controller = new AnimationController(
        duration: Duration(milliseconds: widget.animationMilliseconds),
        vsync: this);
  }

  _onController() {
    _showDropdownItemWidget();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDropdownWidget();
  }

  dispose() {
    _controller.dispose();
    _isControllerDisposed = true;
    super.dispose();
  }

  _showDropdownItemWidget() {
    int menuIndex = widget.controller.menuIndex;
    if (menuIndex >= widget.menus.length || widget.menus[menuIndex] == null) {
      return;
    }

    _isShowDropdownItemWidget = !_isShowDropdownItemWidget;
    _isShowMask = !_isShowMask;

    _animation =
        new Tween(begin: 0.0, end: widget.menus[menuIndex].dropdownHeight)
            .animate(_controller)
              ..addListener(() {
                if (mounted) {
                  setState(() {});
                }
              });

    if (_isControllerDisposed) return;

    if (_animation.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  Widget _mask() {
    if (_isShowMask) {
      return GestureDetector(
        onTap: () {
          widget.controller.hide();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(0, 0, 0, 0.6),
        ),
      );
    } else {
      return Container(
        height: 0,
      );
    }
  }

  Widget _buildDropdownWidget() {
    int menuIndex = widget.controller.menuIndex;

    if (menuIndex >= widget.menus.length) {
      return Container();
    }

    return Positioned(
        width: MediaQuery.of(context).size.width,
        top: widget.controller.dropdownHeaderHeight,
        left: 0,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: _animation == null ? 0 : _animation.value,
              child: widget.menus[menuIndex].dropdownWidget,
            ),
            _mask()
          ],
        ));
  }
}
