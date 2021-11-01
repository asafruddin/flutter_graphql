// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetailModel _$CharacterDetailModelFromJson(
        Map<String, dynamic> json) =>
    CharacterDetailModel(
      CharacterDetailDataModel.fromJson(
          json['character'] as Map<String, dynamic>),
    );

CharacterDetailDataModel _$CharacterDetailDataModelFromJson(
        Map<String, dynamic> json) =>
    CharacterDetailDataModel(
      json['id'] as String?,
      json['name'] as String?,
      json['image'] as String?,
      json['gender'] as String?,
      json['status'] as String?,
      json['species'] as String?,
      json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      json['origin'] == null
          ? null
          : LocationModel.fromJson(json['origin'] as Map<String, dynamic>),
      (json['episode'] as List<dynamic>?)
          ?.map((e) => EpisodeDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

EpisodeDataModel _$EpisodeDataModelFromJson(Map<String, dynamic> json) =>
    EpisodeDataModel(
      json['id'] as String?,
      json['name'] as String?,
      (json['characters'] as List<dynamic>?)
          ?.map((e) => ResultsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
