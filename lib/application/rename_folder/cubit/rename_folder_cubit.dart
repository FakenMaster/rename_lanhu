import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'rename_folder_state.dart';
part 'rename_folder_cubit.freezed.dart';

class RenameFolderCubit extends Cubit<RenameFolderState> {
  RenameFolderCubit() : super(RenameFolderInitial());
}
