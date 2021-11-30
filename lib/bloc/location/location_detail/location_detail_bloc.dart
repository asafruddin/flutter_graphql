import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_graphql_architecture/core/exceptions/failure.dart';
import 'package:flutter_graphql_architecture/domain/entity/location/location_detail_entity.dart';
import 'package:flutter_graphql_architecture/domain/use_case/location/get_location_detail_usecase.dart';

part 'location_detail_event.dart';
part 'location_detail_state.dart';

class LocationDetailBloc
    extends Bloc<LocationDetailEvent, LocationDetailState> {
  final GetLocationDetailUseCase useCase;
  LocationDetailBloc(this.useCase) : super(LocationDetailInitial()) {
    on<OnReqLocationDetail>((event, emit) async {
      emit(ReqLocationDetailLoading());

      final Stream<Either<Failure, LocationDetailEntity>> response =
          useCase.execute(event.id);

      print("Here again => $response");

      response.listen((event) {
        print("After listen --> $event");
        event.fold(
            (l) async => emit(ReqLocationDetailFailure(l.message.toString())),
            (r) async => emit(ReqLocationDetailSuccess(r)));
      });
    });
  }
}
