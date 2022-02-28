import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/user_details.dart';
import '../data/repositories/repository.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final Repository repository;

  UserDetailsCubit(this.repository) : super(UserDetailsInitial());

  void fetchUserDetails() async {
    try {
      final userDetails = await repository.fetchUserDetails();
      emit(UserDetailsLoaded(userDetails));
    } catch (err) {
      emit(UserDetailsError());
    }
  }
}
