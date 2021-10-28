import 'package:flutter_graphql_architecture/storage/local_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  final prefs = await SharedPrefs.getInstance();

  ///register local storage
  sl.registerLazySingleton(() => prefs);
}
