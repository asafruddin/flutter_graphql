// ignore_for_file: avoid_print

import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';
import 'package:flutter_graphql_architecture/domain/use_case/get_characters_use_case.dart';
import 'package:rxdart/rxdart.dart';

class GetCharactersBloc {
  final GetCharactersUseCase useCase;

  GetCharactersBloc(this.useCase);

  final _characters = BehaviorSubject<CharactersEntity>();

  Function(CharactersEntity) get updateCharacters => _characters.sink.add;
  Stream<CharactersEntity> get data => _characters.stream;

  void fetchCharacters(int page) {
    useCase.execute(page).listen((event) {
      event.fold((l) {
        print(
            "Something went wrong when get the characters data : ${l.message}");
        _characters.addError(l.message);
      }, (r) => updateCharacters(r));
    });
  }

  void dispose() {
    _characters.close();
  }
}
