import '../dummy_data.dart';

class UserDetails {
  final String userName;
  final int matchesWon;
  final int highestRating;
  final bool favoriteGamesSelected;
  final String userId;
  final String gender;
  final int winPercentage;
  final int tournamentsPlayed;
  final List<dynamic> favoriteGames;
  final int matchedPlayed;
  final int tournamentsWon;
  final String avatarUrl;
  final int overallRating;
  final String userHandler;

  UserDetails.fromJson(Map json)
      : userName = json['data']['username'],
        matchesWon = json['data']['matches_won'],
        highestRating = json['data']['highest_rating'],
        favoriteGamesSelected = json['data']['favorite_games_selected'],
        userId = json['data']['user_id'],
        gender = json['data']['gender'],
        winPercentage = json['data']['win_percentage'],
        tournamentsPlayed = json['data']['tournaments_played'],
        favoriteGames = favoriteGamesList,
        matchedPlayed = json['data']['matches_played'],
        tournamentsWon = json['data']['tournaments_won'],
        avatarUrl = json['data']['avatar_url'],
        overallRating = json['data']['overall_rating'] ?? 0,
        userHandler = json['data']['user_handler'];
}
