// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDetailModel _$LocationDetailModelFromJson(Map<String, dynamic> json) =>
    LocationDetailModel(
      DataLocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

DataLocationModel _$DataLocationModelFromJson(Map<String, dynamic> json) =>
    DataLocationModel(
      json['id'] as String?,
      json['name'] as String?,
      json['type'] as String?,
      json['dimension'] as String?,
    );
