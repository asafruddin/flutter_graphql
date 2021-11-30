import 'package:flutter_graphql_architecture/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_architecture/core/use_case/use_case.dart';
import 'package:flutter_graphql_architecture/domain/entity/location/location_detail_entity.dart';
import 'package:flutter_graphql_architecture/domain/repositories/location_repository.dart';

class GetLocationDetailUseCase extends UseCase<LocationDetailEntity, String> {
  final LocationRepository repository;

  GetLocationDetailUseCase(this.repository);

  @override
  Stream<Either<Failure, LocationDetailEntity>> build(String params) {
    return repository.getLocationDetail(params);
  }
}
