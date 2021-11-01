import 'package:flutter_graphql_architecture/data/datasourse/binding_data_sources.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/character_detail.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';
import 'package:flutter_graphql_architecture/storage/local_storage.dart';

class BindingLocal implements BindingDataSources {
  final SharedPrefs? prefs;

  BindingLocal(this.prefs);

  @override
  Stream<CharactersEntity> getCharacters(int page) {
    throw UnimplementedError();
  }

  @override
  Stream<CharacterDetailEntity> getCharacterDetail(String id) {
    throw UnimplementedError();
  }
}
