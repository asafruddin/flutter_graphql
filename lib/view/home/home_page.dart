import 'package:flutter/material.dart';
import 'package:flutter_graphql_architecture/bloc/characters/get_characters_bloc.dart';
import 'package:flutter_graphql_architecture/core/di/injector_container.dart';
import 'package:flutter_graphql_architecture/domain/entity/character_entity/characters_entity.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final charactersBloc = sl<GetCharactersBloc>();

  final pagingController =
      PagingController<int, ResultsEntity>(firstPageKey: 1);

  Future<void> _fetchData(int pageKey) async {
    try {
      charactersBloc.fetchCharacters(pageKey);

      int i = 0;
      charactersBloc.data.listen((event) {
        if (event != null && i == 0) {
          i++;
          final isLastPage = event.characters.isLastPage();
          final newItems = event.characters.results;

          if (isLastPage) {
            pagingController.appendLastPage(newItems!);
          } else {
            final nextPageKey = pageKey + 1;
            pagingController.appendPage(newItems!, nextPageKey);
          }
        }
      });
    } catch (error) {
      pagingController.error(error);
    }
  }

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener(_fetchData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: PagedListView(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<ResultsEntity>(
                itemBuilder: (context, item, index) {
              return ListTile(
                  leading:
                      CircleAvatar(backgroundImage: NetworkImage(item.image!)),
                  subtitle: Text(item.location!.name!),
                  trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.lightGreenAccent[700],
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(item.status!,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.white))),
                  title: Text(item.name!));
            })));
  }
}
