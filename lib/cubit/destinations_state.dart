part of 'destinations_cubit.dart';

@immutable
abstract class DestinationsState extends Equatable {
  const DestinationsState();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class DestinationsInitial extends DestinationsState {}

class DestinationsLoading extends DestinationsState{}

class DestinationsSuccess extends DestinationsState{
  final List<DestinationsModel> destinations;

  DestinationsSuccess(this.destinations);

  @override
  // TODO: implement props
  List<Object?> get props => [destinations];
}

class DestinationsFailed extends DestinationsState{

  final String error;

  DestinationsFailed(this.error);

  @override
  // TODO: implement props
  List<Object?> get props =>[error];

}