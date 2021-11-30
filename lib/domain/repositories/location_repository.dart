import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_architecture/core/exceptions/failure.dart';
import 'package:flutter_graphql_architecture/domain/entity/location/location_detail_entity.dart';

abstract class LocationRepository {
  Stream<Either<Failure, LocationDetailEntity>> getLocationDetail(String id);
}
