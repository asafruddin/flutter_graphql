import 'package:flutter_graphql_architecture/core/constant/query.dart';
import 'package:flutter_graphql_architecture/core/network/service.dart';
import 'package:flutter_graphql_architecture/data/datasourse/binding_data_sources.dart';
import 'package:flutter_graphql_architecture/data/model/response/characters/character_detail_model.dart';
import 'package:flutter_graphql_architecture/data/model/response/characters/characters_model.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/character_detail.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';
import 'package:flutter_graphql_architecture/domain/entity/location/location_detail_entity.dart';
import 'package:flutter_graphql_architecture/data/model/response/location/location_detail_model.dart';

class BindingRemote implements BindingDataSources {
  /// [BindingRemote] for geting data from network
  /// required GraphQlServices
  final GraphQlServices _client;
  BindingRemote(this._client);

  @override
  Stream<CharactersEntity> getCharacters(int page) async* {
    final response =
        await _client.performQuery(Query.characters, variables: {"page": page});

    yield CharactersModel.fromJson(response.data!);
  }

  @override
  Stream<CharacterDetailEntity> getCharacterDetail(String id) async* {
    final response = await _client
        .performQuery(Query.detailCharacter, variables: {"id": id});
    yield CharacterDetailModel.fromJson(response.data!);
  }

  @override
  Stream<LocationDetailEntity> getLocationDetail(String id) async* {
    final response =
        await _client.performQuery(Query.locationDetail, variables: {"id": id});
    yield LocationDetailModel.fromJson(response.data!);
  }
}
