part of 'location_detail_bloc.dart';

abstract class LocationDetailEvent extends Equatable {
  const LocationDetailEvent();

  @override
  List<Object> get props => [];
}

class OnReqLocationDetail extends LocationDetailEvent {
  final String id;

  const OnReqLocationDetail(this.id);
}
