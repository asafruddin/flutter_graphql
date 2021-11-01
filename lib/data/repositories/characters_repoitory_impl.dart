import 'package:flutter_graphql_architecture/data/datasourse/common/base_datasource_factory.dart';
import 'package:flutter_graphql_architecture/data/datasourse/common/datasource_factory.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/character_detail.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';
import 'package:flutter_graphql_architecture/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_architecture/domain/repositories/characters_repository.dart';

class CharacterRepositoryImpl implements CharactersRepository {
  CharacterRepositoryImpl(this._bindingDataSource);

  late final BindingDataSourceFactory _bindingDataSource;

  @override
  Stream<Either<Failure, CharactersEntity>> getCharacters(int page) {
    return _bindingDataSource
        .createData(DataSourceState.network)
        .getCharacters(page)
        .map((event) => Right(event));
  }

  @override
  Stream<Either<Failure, CharacterDetailEntity>> getCharacterDetail(String id) {
    return _bindingDataSource
        .createData(DataSourceState.network)
        .getCharacterDetail(id)
        .map((event) => Right(event));
  }
}
