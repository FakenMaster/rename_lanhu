import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rename_lanhu/application/rename_folder/cubit/rename_folder_cubit.dart';
import 'package:rename_lanhu/infrasture/util/src/sp_keys.dart';
import 'package:rename_lanhu/presentation/rename_folder/widget/folder_select_widget.dart';
import 'package:time/time.dart';

class RenameFolderPage extends StatefulWidget {
  const RenameFolderPage({Key key}) : super(key: key);

  @override
  _RenameFolderPageState createState() => _RenameFolderPageState();
}

class _RenameFolderPageState extends State<RenameFolderPage>
    with AutomaticKeepAliveClientMixin {
  bool loading = false;
  @override
  void initState() {
    super.initState();
    print('RenameFolderPage初始化');
  }

  @override
  void dispose() {
    print('RenameFolderPage销毁');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('RenameFolderPage刷新');
    return BlocListener<RenameFolderCubit, RenameFolderState>(
      child: ModalProgressHUD(
        inAsyncCall: loading,
        opacity: 0.5,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FolderSelectWidget(
                        key: Key('source'),
                        title: '来源路径：',
                        spKey: StorageKeys.SOURCE_DIRECTORY,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FolderSelectWidget(
                        key: Key('destination'),
                        title: '目标路径：',
                        spKey: StorageKeys.DESTINATION_DIRECTORY,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      StreamBuilder<bool>(
                          stream:
                              context.bloc<RenameFolderCubit>().renameStream,
                          builder: (context, snapshot) {
                            return Center(
                              child: RaisedButton(
                                onPressed: snapshot.data == true
                                    ? () {
                                        context
                                            .bloc<RenameFolderCubit>()
                                            .validate();
                                      }
                                    : null,
                                child: Text(
                                  '根据尺寸后缀，分配到不同尺寸文件夹',
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      listener: (context, state) async {
        bool showProgressDialog = false;
        state.maybeMap(
            valid: (state) {
              /// 重新分配到目标文件夹
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text('确定开始转换吗?'),
                        actions: [
                          FlatButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('取消'),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context.bloc<RenameFolderCubit>().rename();
                            },
                            child: Text('确定'),
                          ),
                        ],
                      ));
            },
            renameFail: (value) {
              Flushbar(
                message: '${value.failMessage}',
                duration: 3.seconds,
              ).show(context);
            },
            renameSuccess: (value) {
              Flushbar(
                message: '转换成功',
                duration: 3.seconds,
              ).show(context);
            },
            renameProcessing: (_) => showProgressDialog = true,
            orElse: () {});

        if (loading != showProgressDialog) {
          setState(() {
            loading = showProgressDialog;
          });
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
