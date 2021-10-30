// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersModel _$CharactersModelFromJson(Map<String, dynamic> json) =>
    CharactersModel(
      DataCharactersModel.fromJson(json['characters'] as Map<String, dynamic>),
    );

DataCharactersModel _$DataCharactersModelFromJson(Map<String, dynamic> json) =>
    DataCharactersModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: json['info'] == null
          ? null
          : InfoDataModel.fromJson(json['info'] as Map<String, dynamic>),
    );

InfoDataModel _$InfoDataModelFromJson(Map<String, dynamic> json) =>
    InfoDataModel(
      pages: json['pages'] as int?,
      count: json['count'] as int?,
      next: json['next'] as int?,
      prev: json['prev'] as int?,
    );

ResultsModel _$ResultsModelFromJson(Map<String, dynamic> json) => ResultsModel(
      json['id'] as String?,
      json['name'] as String?,
      json['status'] as String?,
      json['image'] as String?,
      json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      json['id'] as String?,
      json['name'] as String?,
      json['dimension'] as String?,
    );
