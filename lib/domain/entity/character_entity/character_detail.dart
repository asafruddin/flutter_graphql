import 'package:equatable/equatable.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';

class CharacterDetailEntity extends Equatable {
  final CharacterDetailDataEntity? character;

  const CharacterDetailEntity(this.character);

  @override
  List<Object?> get props => [character];
}

class CharacterDetailDataEntity extends Equatable {
  final String? id;
  final String? name;
  final String? image;
  final String? gender;
  final String? status;
  final String? species;
  final LocationEntity? location;
  final LocationEntity? origin;
  final List<EpisodeDataEntity>? episode;

  const CharacterDetailDataEntity(this.id, this.name, this.image, this.gender,
      this.status, this.species, this.location, this.origin, this.episode);

  @override
  List<Object?> get props =>
      [id, name, image, gender, status, species, location, origin, episode];
}

class EpisodeDataEntity extends Equatable {
  final String? id;
  final String? name;
  final List<ResultsEntity>? characters;

  const EpisodeDataEntity(this.id, this.name, this.characters);

  @override
  List<Object?> get props => [id, name, characters];
}
