part of 'location_detail_bloc.dart';

abstract class LocationDetailState extends Equatable {
  const LocationDetailState();

  @override
  List<Object> get props => [];
}

class LocationDetailInitial extends LocationDetailState {}

class ReqLocationDetailLoading extends LocationDetailState {}

class ReqLocationDetailFailure extends LocationDetailState {
  final String? error;

  const ReqLocationDetailFailure(this.error);
}

class ReqLocationDetailSuccess extends LocationDetailState {
  final LocationDetailEntity data;

  const ReqLocationDetailSuccess(this.data);
}
