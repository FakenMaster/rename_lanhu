import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rename_lanhu/application/rename_folder/cubit/rename_folder_cubit.dart';
import 'package:stringx/stringx.dart';

class FolderSelectWidget extends StatefulWidget {
  final String title;
  final String spKey;
  const FolderSelectWidget({
    Key key,
    @required this.title,
    @required this.spKey ,
  })  : assert(title != null),
        assert(spKey != null),
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
        context
            .bloc<RenameFolderCubit>()
            .directoryChange(widget.spKey, _controller.text);
      });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 不这么做，会导致目标文件夹无法监听到数据。而且会把还未发送的来源文件夹的State顶掉，这是cubit的错误吧
      context.bloc<RenameFolderCubit>().getDirectory(widget.spKey);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RenameFolderCubit, RenameFolderState>(
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
                        .bloc<RenameFolderCubit>()
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
                  .bloc<RenameFolderCubit>()
                  .selectDirectory(widget.spKey),
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
