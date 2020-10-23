import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rename_lanhu/application/rename_folder/bloc/rename_folder_bloc.dart';
import 'package:rename_lanhu/infrasture/util/sp_keys.dart';
import 'package:stringx/stringx.dart';

class FolderSelectWidget extends StatefulWidget {
  final String title;
  //是否来源文件夹
  final bool source;
  final String spKey;
  const FolderSelectWidget({
    Key key,
    @required this.title,
    this.source = true,
  })  : assert(title != null),
        assert(source != null),
        spKey = source == true ? SOURCE_DIRECTORY : DESTINATION_DIRECTORY,
        super(key: key);

  @override
  _FolderSelectWidgetState createState() => _FolderSelectWidgetState();
}

class _FolderSelectWidgetState extends State<FolderSelectWidget> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController()
      ..addListener(() {
        context.bloc<RenameFolderBloc>().add(
            RenameFolderEvent.directoryChange(widget.spKey, _controller.text));
      });
    context
        .bloc<RenameFolderBloc>()
        .add(RenameFolderEvent.getDirectory(widget.spKey));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RenameFolderBloc, RenameFolderState>(
        listener: (_, state) {
          state.maybeMap(
              directoryStorage: (state) {
                if (state.spKey == widget.spKey) {
                  _controller.text = state.directory;
                }
              },
              selectDirectorySuccess: (state) {
                if (state.spKey == widget.spKey) {
                  _controller.text = state.directory;
                }
              },
              orElse: () {});
        },
        child: Row(
          children: [
            Text(
              '${widget.title}',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: TextField(
                controller: _controller,
                style: TextStyle(
                  fontSize: 35,
                ),
                decoration: InputDecoration(
                  suffix: StreamBuilder<String>(
                    stream: context
                        .bloc<RenameFolderBloc>()
                        .directoryStream(widget.spKey),
                    builder: (context, snapshot) {
                      return snapshot.data.isNullOrEmpty()
                          ? SizedBox()
                          : IconButton(
                              onPressed: () async {
                                _controller.text = '';
                              },
                              icon: Icon(
                                Ionicons.close,
                              ),
                            );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              iconSize: 40,
              onPressed: () => context
                  .bloc<RenameFolderBloc>()
                  .add(RenameFolderEvent.selectDirectory(widget.spKey)),
              icon: Icon(
                Ionicons.ellipsis_horizontal,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ));
  }
}
