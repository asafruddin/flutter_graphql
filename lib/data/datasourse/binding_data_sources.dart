import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';

abstract class BindingDataSources {
  Stream<CharactersEntity> getCharacters(int page);
}
