import 'package:flutter_graphql_architecture/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_architecture/core/use_case/use_case.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';
import 'package:flutter_graphql_architecture/domain/repositories/characters_repository.dart';

class GetCharactersUseCase extends UseCase<CharactersEntity, int> {
  final CharactersRepository repository;

  GetCharactersUseCase(this.repository);

  @override
  Stream<Either<Failure, CharactersEntity>> build(int params) {
    return repository.getCharacters(params);
  }
}
