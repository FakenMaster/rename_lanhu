import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rename_lanhu/infrasture/util/util.dart';
import 'package:rename_lanhu/presentation/popup/popup_widget.dart';
import 'package:stringx/stringx.dart';

/// TODO:复杂的界面实现，可以传入自定义的ListView itemBuilder，或者非ListView的Widget。
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
          PopupWidget.listBuilder(
            titles: getTitles(),
            contents: contents,
            itemBuilders: List.generate(titles.length, (menuIndex) {
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
                            color: selected
                                ? LibraryColor.Primary
                                : Colors.black54,
                          ),
                        ),
                      );
              };
            }),
            onMenuSelect: (index) {
              setState(() {
                selectMenuIndex = index;
              });
            },
            onContentSelect: (index) {
              setState(() {
                selectDataList[selectMenuIndex] =
                    contents[selectMenuIndex][index];
              });
            },
          ),
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
}
