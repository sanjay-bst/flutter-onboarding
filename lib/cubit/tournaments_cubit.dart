import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/tournaments.dart';
import '../data/repositories/repository.dart';

part 'tournaments_state.dart';

class TournamentsCubit extends Cubit<TournamentsState> {
  final Repository repository;

  TournamentsCubit(this.repository) : super(TournamentsInitial());

  void fetchTournaments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');
    final token = prefs.getString('token');

    repository.fetchTournaments(userId, token).then((tournaments) {
      emit(TournamentsLoaded(tournaments));
    });
  }
}
