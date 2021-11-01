import 'package:flutter_graphql_architecture/bloc/characters/get_character_detail_bloc.dart';
import 'package:flutter_graphql_architecture/bloc/characters/get_characters_bloc.dart';
import 'package:flutter_graphql_architecture/core/network/service.dart';
import 'package:flutter_graphql_architecture/data/datasourse/binding/binding_local.dart';
import 'package:flutter_graphql_architecture/data/datasourse/binding/binding_remote.dart';
import 'package:flutter_graphql_architecture/data/datasourse/common/datasource_factory.dart';
import 'package:flutter_graphql_architecture/data/repositories/characters_repoitory_impl.dart';
import 'package:flutter_graphql_architecture/domain/repositories/characters_repository.dart';
import 'package:flutter_graphql_architecture/domain/use_case/characters/get_character_detail_usecase.dart';
import 'package:flutter_graphql_architecture/domain/use_case/characters/get_characters_use_case.dart';
import 'package:flutter_graphql_architecture/storage/local_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  final prefs = await SharedPrefs.getInstance();
  final gqlService = GraphQlServices();

  ///register local storage
  sl.registerLazySingleton(() => prefs);

  /// register GraphQL services
  sl.registerLazySingleton(() => gqlService);

  /// binding datasources
  /// [localData]
  sl.registerFactory(() => BindingLocal(sl()));

  /// [networkData]
  sl.registerFactory(() => BindingRemote(sl()));

  /// data sources
  sl.registerFactory(
      () => BindingDataSourceFactory(bindingRemote: sl(), bindingLocal: sl()));

  /// repository
  sl.registerFactory<CharactersRepository>(() => CharacterRepositoryImpl(sl()));

  /// use case
  sl.registerFactory(() => GetCharactersUseCase(sl()));
  sl.registerFactory(() => GetCharacterDetailUseCase(sl()));

  /// bloc
  sl.registerFactory(() => GetCharactersBloc(sl()));
  sl.registerFactory(() => GetCharacterDetailBloc(sl()));
}
