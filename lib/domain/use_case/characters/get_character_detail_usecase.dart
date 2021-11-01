import 'package:flutter_graphql_architecture/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_architecture/core/use_case/use_case.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/character_detail.dart';
import 'package:flutter_graphql_architecture/domain/repositories/characters_repository.dart';

class GetCharacterDetailUseCase extends UseCase<CharacterDetailEntity, String> {
  final CharactersRepository repository;

  GetCharacterDetailUseCase(this.repository);

  @override
  Stream<Either<Failure, CharacterDetailEntity>> build(String params) {
    return repository.getCharacterDetail(params);
  }
}
