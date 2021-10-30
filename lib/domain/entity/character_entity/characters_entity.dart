import 'package:equatable/equatable.dart';

class CharactersEntity extends Equatable {
  final DataCharactersEntity characters;

  const CharactersEntity(this.characters);

  @override
  List<Object?> get props => [characters];
}

class DataCharactersEntity extends Equatable {
  final List<ResultsEntity>? results;
  final InfoDataEntity? info;

  bool isLastPage() {
    return info?.next == null;
  }

  const DataCharactersEntity(this.results, this.info);
  @override
  List<Object?> get props => [results, info];
}

class InfoDataEntity extends Equatable {
  final int? pages;
  final int? count;
  final int? next;
  final int? prev;

  const InfoDataEntity({this.pages, this.count, this.next, this.prev});

  @override
  List<Object?> get props => [pages, count, next, prev];
}

class ResultsEntity extends Equatable {
  final String? id;
  final String? name;
  final String? status;
  final String? image;
  final LocationEntity? location;

  const ResultsEntity(
      this.id, this.name, this.status, this.image, this.location);
  @override
  List<Object?> get props => [id, name, status, image, location];
}

class LocationEntity extends Equatable {
  final String? id;
  final String? name;
  final String? dimension;

  const LocationEntity(this.id, this.name, this.dimension);

  @override
  List<Object?> get props => [id, name, dimension];
}
