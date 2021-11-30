import 'package:equatable/equatable.dart';

class LocationDetailEntity extends Equatable {
  final DataLocationEntity location;

  const LocationDetailEntity(this.location);

  @override
  List<Object?> get props => [location];
}

class DataLocationEntity extends Equatable {
  final String? id;
  final String? name;
  final String? type;
  final String? dimension;

  const DataLocationEntity(this.id, this.name, this.type, this.dimension);

  @override
  List<Object?> get props => [id, name, type, dimension];
}
