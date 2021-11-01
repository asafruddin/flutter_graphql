import 'package:flutter/material.dart';
import 'package:flutter_graphql_architecture/bloc/characters/get_character_detail_bloc.dart';
import 'package:flutter_graphql_architecture/core/di/injector_container.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/character_detail.dart';

class DetailCharacters extends StatefulWidget {
  const DetailCharacters({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _DetailCharactersState createState() => _DetailCharactersState();
}

class _DetailCharactersState extends State<DetailCharacters> {
  final detailCharacterBloc = sl<GetCharacterDetailBloc>();

  @override
  void initState() {
    super.initState();
    detailCharacterBloc.fetchCharacters(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Character")),
        body: StreamBuilder<CharacterDetailEntity>(
            stream: detailCharacterBloc.data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: [
                  Center(
                      child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data!.character!.image!),
                          radius: 50)),
                  const SizedBox(height: 10.0),
                  Center(
                      child: Text(snapshot.data!.character!.name!,
                          style: Theme.of(context).textTheme.headline5)),
                  Center(
                      child: Text(snapshot.data!.character!.species!,
                          style: Theme.of(context).textTheme.bodyText2)),
                  buildListData(snapshot),
                  buildListEpisode(snapshot)
                ]);
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }

  buildListData(AsyncSnapshot<CharacterDetailEntity> snapshot) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListTile(
              trailing: Text(snapshot.data!.character!.location!.name!,
                  style: Theme.of(context).textTheme.subtitle1),
              title:
                  Text('Location', style: Theme.of(context).textTheme.caption)),
          ListTile(
              trailing: Text(snapshot.data!.character!.origin!.name!,
                  style: Theme.of(context).textTheme.subtitle1),
              title:
                  Text('Origin', style: Theme.of(context).textTheme.caption)),
          ListTile(
              trailing: Text(snapshot.data!.character!.gender!,
                  style: Theme.of(context).textTheme.subtitle1),
              title: Text('Gender', style: Theme.of(context).textTheme.caption))
        ]);
  }

  buildListEpisode(AsyncSnapshot<CharacterDetailEntity> snapshot) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemCount: snapshot.data!.character!.episode!.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
              title: Text(snapshot.data!.character!.episode![index].name!),
              children: snapshot.data!.character!.episode![index].characters!
                  .map((e) => ListTile(
                      title: Text(e.name!),
                      subtitle: Text(e.location!.name!),
                      trailing: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.lightGreenAccent[700],
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(e.status!,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white)))))
                  .toList());
        });
  }
}
