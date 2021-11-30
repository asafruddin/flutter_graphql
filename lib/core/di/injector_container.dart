import 'package:flutter_graphql_architecture/bloc/characters/get_character_detail_bloc.dart';
import 'package:flutter_graphql_architecture/bloc/characters/get_characters_bloc.dart';
import 'package:flutter_graphql_architecture/bloc/location/location_detail/location_detail_bloc.dart';
import 'package:flutter_graphql_architecture/core/network/service.dart';
import 'package:flutter_graphql_architecture/data/datasourse/binding/binding_local.dart';
import 'package:flutter_graphql_architecture/data/datasourse/binding/binding_remote.dart';
import 'package:flutter_graphql_architecture/data/datasourse/common/datasource_factory.dart';
import 'package:flutter_graphql_architecture/data/repositories/characters_repoitory_impl.dart';
import 'package:flutter_graphql_architecture/data/repositories/location_repository_impl.dart';
import 'package:flutter_graphql_architecture/domain/repositories/characters_repository.dart';
import 'package:flutter_graphql_architecture/domain/repositories/location_repository.dart';
import 'package:flutter_graphql_architecture/domain/use_case/characters/get_character_detail_usecase.dart';
import 'package:flutter_graphql_architecture/domain/use_case/characters/get_characters_use_case.dart';
import 'package:flutter_graphql_architecture/domain/use_case/location/get_location_detail_usecase.dart';
import 'package:flutter_graphql_architecture/env/config.dart';
import 'package:flutter_graphql_architecture/storage/local_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  /// initiation local storage
  ///
  late final config = Config.getInstance();
  final prefs = await SharedPrefs.getInstance();

  /// [networkConfig]
  /// register for environment (flavor)
  sl.registerLazySingleton(() => config);

  /// [local]
  ///register for local storage
  sl.registerLazySingleton(() => prefs);

  /// initiation graphql services [network]
  final gqlService = GraphQlServices(sl());

  /// [client]
  /// register GraphQL services
  sl.registerLazySingleton(() => gqlService);

  /// [datasources]
  /// handle the source data that come from local storage
  sl.registerFactory(() => BindingLocal(sl()));

  /// handle the source data that come from network or server
  sl.registerFactory(() => BindingRemote(sl()));

  /// collecting the data sources
  sl.registerFactory(
      () => BindingDataSourceFactory(bindingRemote: sl(), bindingLocal: sl()));

  /// handle the data repository
  sl.registerFactory<CharactersRepository>(() => CharacterRepositoryImpl(sl()));
  sl.registerFactory<LocationRepository>(() => LocationRespositoryImpl(sl()));

  /// [useCase]
  sl.registerFactory(() => GetCharactersUseCase(sl()));
  sl.registerFactory(() => GetCharacterDetailUseCase(sl()));
  sl.registerFactory(() => GetLocationDetailUseCase(sl()));

  /// [bloc]
  sl.registerFactory(() => GetCharactersBloc(sl()));
  sl.registerFactory(() => GetCharacterDetailBloc(sl()));
  sl.registerFactory(() => LocationDetailBloc(sl()));
}
