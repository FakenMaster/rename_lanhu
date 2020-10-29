import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rename_lanhu/application/directory_select/cubit/directory_select_cubit.dart';
import 'package:rename_lanhu/infrasture/dependency_injection/injector.dart';
import 'package:rename_lanhu/infrasture/util/src/sp_keys.dart';
import 'package:rename_lanhu/presentation/rename_file/widget/directory_select_widget.dart';
import 'package:rename_lanhu/presentation/rename_file/widget/file_list_widget.dart';

class RenameFilePage extends StatelessWidget {
  const RenameFilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DirectorySelectCubit>(
      create: (context) => getIt<DirectorySelectCubit>()
        ..getDirectory(StorageKeys.FILE_LIST_DIRECTORY),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DirectorySelectWidget(
                spKey: StorageKeys.FILE_LIST_DIRECTORY,
              ),
              Expanded(
                child: FileListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
