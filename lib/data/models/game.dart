class Game {
  final String id;
  final String name;
  final bool isClubWarEnabled;
  final String iconUrl;
  final String supportStatus;

  Game.fromJson(Map json)
      : id = json['game_id'],
        name = json['game_name'],
        isClubWarEnabled = json['is_club_war_enabled'],
        iconUrl = json['icon_url'],
        supportStatus = json['app_support_status'];
}
