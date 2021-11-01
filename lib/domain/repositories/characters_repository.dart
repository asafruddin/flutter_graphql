import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_architecture/core/exceptions/failure.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/character_detail.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';

abstract class CharactersRepository {
  Stream<Either<Failure, CharactersEntity>> getCharacters(int page);
  Stream<Either<Failure, CharacterDetailEntity>> getCharacterDetail(String id);
}
