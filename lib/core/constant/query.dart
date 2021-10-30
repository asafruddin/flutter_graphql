class Query {
  Query._();

  static const characters = r'''
  query characters($page: Int){
  characters(page: $page){
    results{
      id
      name
      status
      image
      location{
        id
        name
        dimension
        }
      }
    }
  }
  ''';
}
