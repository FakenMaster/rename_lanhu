import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stringx/stringx.dart';

class FolderChooseWidget extends StatefulWidget {
  final String title;
  final Function(String directory) onChange;

  const FolderChooseWidget({
    Key key,
    @required this.title,
    @required this.onChange,
  })  : assert(title != null),
        assert(onChange != null),
        super(key: key);

  @override
  _FolderChooseWidgetState createState() => _FolderChooseWidgetState();
}

class _FolderChooseWidgetState extends State<FolderChooseWidget> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() {
        widget.onChange(_controller.text);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
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
