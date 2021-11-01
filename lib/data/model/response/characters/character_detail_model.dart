import 'package:flutter_graphql_architecture/data/model/response/characters/characters_model.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/character_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_detail_model.g.dart';

@JsonSerializable(explicitToJson: false, createToJson: false)
class CharacterDetailModel extends CharacterDetailEntity {
  const CharacterDetailModel(CharacterDetailDataModel character)
      : super(character);

  factory CharacterDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailModelFromJson(json);
}

@JsonSerializable(explicitToJson: false, createToJson: false)
class CharacterDetailDataModel extends CharacterDetailDataEntity {
  const CharacterDetailDataModel(
      String? id,
      String? name,
      String? image,
      String? gender,
      String? status,
      String? species,
      LocationModel? location,
      LocationModel? origin,
      List<EpisodeDataModel>? episode)
      : super(id, name, image, gender, status, species, location, origin,
            episode);

  factory CharacterDetailDataModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailDataModelFromJson(json);
}

@JsonSerializable(explicitToJson: false, createToJson: false)
class EpisodeDataModel extends EpisodeDataEntity {
  const EpisodeDataModel(
      String? id, String? name, List<ResultsModel>? characters)
      : super(id, name, characters);

  factory EpisodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDataModelFromJson(json);
}
