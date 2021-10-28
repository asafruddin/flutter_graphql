import 'package:flutter_graphql_architecture/data/datasourse/binding_data_sources.dart';
import 'package:flutter_graphql_architecture/storage/local_storage.dart';

class BindingLocal implements BindingDataSources {
  final SharedPrefs? prefs;

  BindingLocal(this.prefs);
}
