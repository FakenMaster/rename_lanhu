import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rename_lanhu/infrasture/dependency_injection/injector.dart';
import 'package:rename_lanhu/infrasture/util/sp_keys.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stringx/stringx.dart';
import 'package:time/time.dart';

class FolderChooseWidget extends StatefulWidget {
  final String title;
  final Function(String directory) onChange;
  //是否来源文件夹
  final bool source;
  const FolderChooseWidget({
    Key key,
    @required this.title,
    @required this.onChange,
    this.source = true,
  })  : assert(title != null),
        assert(onChange != null),
        assert(source != null),
        super(key: key);

  @override
  _FolderChooseWidgetState createState() => _FolderChooseWidgetState();
}

class _FolderChooseWidgetState extends State<FolderChooseWidget> {
  TextEditingController _controller;

  BehaviorSubject<String> _directoryStream;
  @override
  void initState() {
    super.initState();
    final spKey = widget.source ? SOURCE_DIRECTORY : DESTINATION_DIRECTORY;
    _directoryStream = BehaviorSubject<String>.seeded('');
    _controller = TextEditingController()
      ..addListener(() {
        widget.onChange(_controller.text);
        _directoryStream.add(_controller.text);
      });

    _controller.text = getIt<SharedPreferences>().getString(spKey) ?? '';

    // 500ms之内的最后值，并且与最开始发射的值不同才存入本地
    _directoryStream
        .where((String directory) => directory != null)
        .debounceTime(500.milliseconds)
        .distinct()
        .listen((String directory) {
      getIt<SharedPreferences>().setString(SOURCE_DIRECTORY, directory);
    }).onError((error) {
      print(error);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _directoryStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget.title}',
          style: DefaultTextStyle.of(context).style,
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: TextField(
            controller: _controller,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RaisedButton.icon(
          onPressed: () async {
            String path = await FilePicker.platform.getDirectoryPath();
            if (path.notNullAndEmpty()) {
              _controller.text = path;
            }
          },
          icon: Icon(Icons.more_horiz),
          label: Text('选择文件夹'),
        ),
        SizedBox(
          width: 10,
        ),
        RaisedButton.icon(
          onPressed: () async {
            _controller.text = '';
          },
          icon: Icon(Icons.clear),
          label: Text('清除'),
        ),
      ],
    );
  }
}
