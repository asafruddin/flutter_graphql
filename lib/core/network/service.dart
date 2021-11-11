import 'package:flutter_graphql_architecture/env/config.dart';
import 'package:graphql/client.dart';

class GraphQlServices {
  /// service for performing graphql
  /// for [performQuery] or [performMutaton]
  ///
  GraphQlServices(this.config);

  final Config config;

  /// link for graphql client link
  late HttpLink httplink = HttpLink(config.baseUrl!);

  /// the client is for performing the query or mutation
  /// for doing the action with graphql
  /// like [create], [read], [update], or [delete]
  late final GraphQLClient _client =
      GraphQLClient(link: httplink, cache: GraphQLCache());

  /// usualy perform query is for [getting] the data
  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic>? variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables ?? {});

    final result = await _client.query(options);
    return result;
  }

  /// usualy mutation is for [update] or [store] or [delete] the data
  Future<QueryResult> performMutation(String query,
      {Map<String, dynamic>? variables}) async {
    MutationOptions options =
        MutationOptions(document: gql(query), variables: variables ?? {});
    final result = await _client.mutate(options);

    return result;
  }
}
