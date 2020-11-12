import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rename_lanhu/infrasture/util/util.dart';
import 'package:stringx/stringx.dart';

class DropdownMenuWidget extends StatelessWidget {
  const DropdownMenuWidget({Key key, this.titles, this.headerHeight})
      : super(key: key);
  final List<String> titles;
  final double headerHeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: titles
          .mapWithIndex((index, value) => DropdownMenuHead(
                title: value,
              ))
          .toList(),
    );
  }
}

class DropdownMenuHead extends StatelessWidget {
  const DropdownMenuHead({Key key, this.title, this.headerHeight = 40})
      : super(key: key);

  /// header title
  final String title;

  /// header height, default is 40
  final double headerHeight;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: LibraryColor.Primary,
        height: headerHeight,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text('$title'),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownMenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
