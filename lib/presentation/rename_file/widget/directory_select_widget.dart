import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rename_lanhu/application/directory_select/cubit/directory_select_cubit.dart';

/// TODO: 1. 打开时获取本地存储的上次目录 2. 选择、修改目录时保存到本地存储
/// 3. Text显示已选择的目录，如果不存在给出❌提示。双击或者点击suffix_icon，悬浮框显示从当前文件夹到最顶层的各级目录
///
class DirectorySelectWidget extends StatelessWidget {
  const DirectorySelectWidget({Key key, this.spKey}) : super(key: key);

  final String spKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<DirectorySelectCubit, DirectorySelectState>(
              builder: (context, state) {
            String text = state.maybeMap(
                orElse: () => null, success: (state) => state.directory);
            return Text(
              '${text ?? ''}',
              maxLines: 1,
              style: TextStyle(
                fontSize: 35,
              ),
            );
          }),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          iconSize: 40,
          onPressed: () =>
              context.bloc<DirectorySelectCubit>().selectDirectory(spKey),
          icon: Icon(
            Ionicons.ellipsis_horizontal,
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
