import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_graphql_architecture/core/exceptions/failure.dart';

abstract class UseCase<Type, Params> {
  Stream<Either<Failure, Type>> build(Params params);

  Stream<Either<Failure, Type>> execute(Params params) {
    return build(params).onErrorResume((error) {
      Failure failure;
      if (error is Failure) {
        failure = error;
      } else if (error is GraphQLError) {
        failure = ServerFailure(message: error.message);
      } else {
        failure = AnotherFailure(error.toString());
      }
      return Stream.value(Left(failure));
    });
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
