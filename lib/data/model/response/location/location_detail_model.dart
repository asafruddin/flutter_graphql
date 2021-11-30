import 'package:flutter_graphql_architecture/domain/entity/location/location_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_detail_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class LocationDetailModel extends LocationDetailEntity {
  const LocationDetailModel(DataLocationModel location) : super(location);

  factory LocationDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class DataLocationModel extends DataLocationEntity {
  const DataLocationModel(
      String? id, String? name, String? type, String? dimension)
      : super(id, name, type, dimension);

  factory DataLocationModel.fromJson(Map<String, dynamic> json) =>
      _$DataLocationModelFromJson(json);
}
