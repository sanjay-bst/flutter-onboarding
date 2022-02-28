part of 'user_details_cubit.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsError extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  final UserDetails userDetails;

  UserDetailsLoaded(this.userDetails);
}
