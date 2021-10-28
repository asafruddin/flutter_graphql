class Query {
  Query._();

  static const spaceships = r'''
  query{
    spaceships {
      data {
        _id
        name
      }
    }
  }
  ''';
}
