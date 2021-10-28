import 'package:graphql/client.dart';

class GraphQlServices {
  HttpLink httplink = HttpLink('https://graphql.fauna.com/graphql',
      defaultHeaders: {
        'Authorization': 'Bearer fnAES-Iy9ZACTMT6YDB0aPhbhyUnyktnXpMvmJWG'
      });
  late final GraphQLClient _client =
      GraphQLClient(link: httplink, cache: GraphQLCache());

  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic>? variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables ?? {});

    final result = await _client.query(options);

    return result;
  }

  Future<QueryResult> performMutation(String query,
      {Map<String, dynamic>? variables}) async {
    MutationOptions options =
        MutationOptions(document: gql(query), variables: variables ?? {});
    final result = await _client.mutate(options);

    return result;
  }
}