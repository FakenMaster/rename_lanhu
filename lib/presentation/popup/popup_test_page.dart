import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rename_lanhu/infrasture/util/util.dart';
import 'package:rename_lanhu/presentation/popup/popup_widget.dart';
import 'package:stringx/stringx.dart';

/// TODO:复杂的界面实现，可以传入自定义的ListView itemBuilder，或者非ListView的Widget。
///
/// 第一步：实现单一列表的滑动距离保存✅
/// 第二部：实现自定义Widget（如果超过一屏需要滑动，也和第一步类似，保存即可）
/// 第三部：实现多个联动列表，保存滑动距离
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

  List<String> getTitles() {
    return selectDataList
        .mapWithIndex((index, content) => content ?? titles[index])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹出框'),
      ),
      body: Column(
        children: [
          buildPopupWidget(),
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

  PopupWidget buildPopupWidget() {
    return PopupWidget(
      titles: getTitles(),
      contents: contents,
      contentBuilders: contentBuilders(),
      itemBuilders: itemBuilders(),
      onMenuSelect: (index) {
        setState(() {
          selectMenuIndex = index;
        });
      },
      onContentSelect: (index) {
        setState(() {
          selectDataList[selectMenuIndex] = contents[selectMenuIndex][index];
        });
      },
    );
  }

  List<WidgetBuilder> contentBuilders() {
    return List.generate(titles.length, (menuIndex) {
      return (context) {
        return Material(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Flutter Null Safety $menuIndex',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
                Icon(
                  Ionicons.airplane,
                  color: LibraryColor.Primary,
                  size: 40,
                ),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        );
      };
    });
  }

  List<IndexedSelectedWidgetBuilder> itemBuilders() {
    return List.generate(titles.length, (menuIndex) {
      return (context, index, selected) {
        Color color = selected ? LibraryColor.Primary : Colors.black87;
        String content = contents[menuIndex][index];
        return menuIndex.isEven
            ? ListTile(
                leading: Icon(Ionicons.watch, color: color),
                title: Text(
                  contents[menuIndex][index],
                  style: TextStyle(color: color),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '$content',
                  style: TextStyle(
                    fontSize: 16,
                    color: selected ? LibraryColor.Primary : Colors.black54,
                  ),
                ),
              );
      };
    });
  }
}
