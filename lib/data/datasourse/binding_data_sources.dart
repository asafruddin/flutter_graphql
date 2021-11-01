import 'package:flutter_graphql_architecture/domain/entity/character_entity/character_detail.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';

abstract class BindingDataSources {
  Stream<CharactersEntity> getCharacters(int page);
  Stream<CharacterDetailEntity> getCharacterDetail(String id);
}
