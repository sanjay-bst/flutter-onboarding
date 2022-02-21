import '../models/tournaments.dart';
import '../services/network.dart';

class Repository {
  final NetworkService networkService;

  Repository(this.networkService);

  Future<Tournaments> fetchTournaments(userId, token) async {
    final tournamentsRow = await networkService.fetchTournaments(userId, token);

    return Tournaments.fromJson(tournamentsRow);
  }
}
