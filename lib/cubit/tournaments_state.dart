part of 'tournaments_cubit.dart';

@immutable
abstract class TournamentsState {}

class TournamentsInitial extends TournamentsState {}

class TournamentsLoaded extends TournamentsState {
  final Tournaments tournaments;

  TournamentsLoaded(this.tournaments);
}
