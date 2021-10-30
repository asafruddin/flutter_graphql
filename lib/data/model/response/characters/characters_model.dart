import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'characters_model.g.dart';

@JsonSerializable(explicitToJson: false, createToJson: false)
class CharactersModel extends CharactersEntity {
  const CharactersModel(DataCharactersModel characters) : super(characters);

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersModelFromJson(json);
}

@JsonSerializable(explicitToJson: false, createToJson: false)
class DataCharactersModel extends DataCharactersEntity {
  const DataCharactersModel({List<ResultsModel>? results, InfoDataModel? info})
      : super(results, info);

  factory DataCharactersModel.fromJson(Map<String, dynamic> json) =>
      _$DataCharactersModelFromJson(json);
}

@JsonSerializable(explicitToJson: false, createToJson: false)
class InfoDataModel extends InfoDataEntity {
  const InfoDataModel({int? pages, int? count, int? next, int? prev})
      : super(count: count, next: next, pages: pages, prev: prev);

  factory InfoDataModel.fromJson(Map<String, dynamic> json) =>
      _$InfoDataModelFromJson(json);
}

@JsonSerializable(explicitToJson: false, createToJson: false)
class ResultsModel extends ResultsEntity {
  const ResultsModel(String? id, String? name, String? status, String? image,
      LocationModel? location)
      : super(id, name, status, image, location);

  factory ResultsModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsModelFromJson(json);
}

@JsonSerializable(explicitToJson: false, createToJson: false)
class LocationModel extends LocationEntity {
  const LocationModel(String? id, String? name, String? dimension)
      : super(id, name, dimension);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
