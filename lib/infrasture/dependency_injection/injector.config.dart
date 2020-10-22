// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injector.dart';
import '../../application/rename_folder/bloc/rename_folder_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  final sharedPreferences = await registerModule.prefs;
  gh.lazySingleton<SharedPreferences>(() => sharedPreferences);
  gh.factory<RenameFolderBloc>(
      () => RenameFolderBloc(get<SharedPreferences>()));
  return get;
}

class _$RegisterModule extends RegisterModule {}
