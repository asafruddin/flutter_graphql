// ignore_for_file: avoid_print

import 'package:flutter_graphql_architecture/domain/entity/character_entity/character_detail.dart';
import 'package:flutter_graphql_architecture/domain/use_case/characters/get_character_detail_usecase.dart';
import 'package:rxdart/rxdart.dart';

class GetCharacterDetailBloc {
  final GetCharacterDetailUseCase useCase;

  GetCharacterDetailBloc(this.useCase);

  final _detailCharacter = BehaviorSubject<CharacterDetailEntity>();

  Function(CharacterDetailEntity) get updateDetailCharacter =>
      _detailCharacter.sink.add;

  Stream<CharacterDetailEntity> get data => _detailCharacter.stream;

  void fetchCharacters(String id) {
    useCase.execute(id).listen((event) {
      event.fold((l) {
        print("Something went wrong when get character detail : ${l.message}");
        _detailCharacter.addError(l.message);
      }, (r) => updateDetailCharacter(r));
    });
  }

  void dispose() {
    _detailCharacter.close();
  }
}
