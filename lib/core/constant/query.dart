class Query {
  Query._();

  static const characters = r'''
  query characters($page: Int){
  characters(page: $page){
    info{
      pages
      count
      next
      prev
    }
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

  static const detailCharacter = r'''
  query character($id: ID!) {
  character(id: $id){
    id
    name
    image
    gender
    status
    species
    location{
      id
      name
      dimension
    }
    origin{
      id
      name
      dimension
    }
    episode{
      name
      characters{
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
  }
  ''';
}
