import 'package:flutter_graphql_architecture/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_architecture/data/datasourse/common/base_datasource_factory.dart';
import 'package:flutter_graphql_architecture/data/datasourse/common/datasource_factory.dart';
import 'package:flutter_graphql_architecture/domain/entity/location/location_detail_entity.dart';
import 'package:flutter_graphql_architecture/domain/repositories/location_repository.dart';

class LocationRespositoryImpl implements LocationRepository {
  LocationRespositoryImpl(this.bindingDataSource);
  late final BindingDataSourceFactory bindingDataSource;

  @override
  Stream<Either<Failure, LocationDetailEntity>> getLocationDetail(String id) {
    return bindingDataSource
        .createData(DataSourceState.network)
        .getLocationDetail(id)
        .map((event) => Right(event));
  }
}
