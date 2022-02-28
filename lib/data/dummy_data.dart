const favoriteGamesList = [
  {
    "game_id": "-brawl-stars",
    "is_club_war_enabled": true,
    "icon_url":
        "https://cdn.game.tv/tournaments/engg/native_app/game/images/brawl_stars_sqaure.png",
    "game_name": "Brawl Stars",
    "app_support_status": "live"
  },
  {
    "is_club_war_enabled": true,
    "icon_url":
        "https://cdn.game.tv/tournaments/engg/native_app/game/images/pubgm_sqaure.png",
    "game_name": "PUBG",
    "app_support_status": "live",
    "game_id": "-pubg-mobile"
  },
  {
    "game_id": "-free-fire",
    "is_club_war_enabled": true,
    "app_support_status": "live",
    "game_name": "Free Fire",
    "supported_geos": ["in"],
    "icon_url":
        "https://cdn.game.tv/tournaments/engg/native_app/game/images/free_fire_square.png"
  },
  {
    "is_club_war_enabled": true,
    "icon_url":
        "https://cdn.game.tv/tournaments/engg/native_app/game/images/codm_square.png",
    "game_name": "COD",
    "app_support_status": "live",
    "game_id": "-call-of-duty:-mobile"
  },
  {
    "is_club_war_enabled": true,
    "icon_url":
        "https://cdn.game.tv/tournaments/engg/native_app/game/images/animal_tower_sqaure.png",
    "game_name": "ATB",
    "app_support_status": "live",
    "game_id": "-animaltower-wars"
  },
  {
    "app_support_status": "live",
    "game_id": "-among-us",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/D95FA2.png",
    "is_club_war_enabled": true,
    "game_name": "Among Us"
  },
  {
    "app_support_status": "live",
    "game_id": "-ludo-king",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/5E951B.png",
    "is_club_war_enabled": false,
    "game_name": "Ludo King"
  },
  {
    "app_support_status": "live",
    "game_id": "-chess-rush",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/4ACE9C.png",
    "is_club_war_enabled": true,
    "game_name": "Chess Rush"
  },
  {
    "app_support_status": "live",
    "game_id": "-mobile-legends",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/50ED6B.png",
    "is_club_war_enabled": true,
    "game_name": "Mobile Legends"
  },
  {
    "app_support_status": "live",
    "game_id": "-kartrider-rush-",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/97D4EA.png",
    "is_club_war_enabled": true,
    "game_name": "KartRider Rush"
  },
  {
    "app_support_status": "live",
    "game_id": "-fortnite",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/EEE156.png",
    "is_club_war_enabled": true,
    "game_name": "Fortnite"
  },
  {
    "app_support_status": "live",
    "game_id": "-golf-battle",
    "icon_url":
        "https://cdn.game.tv/tournaments/temp/images/temp_f272053c8cf04cb1bf43839efa75b0e8",
    "is_club_war_enabled": true,
    "game_name": "Golf Battle"
  },
  {
    "app_support_status": "live",
    "game_id": "_fau-g",
    "icon_url":
        "https://cdn.game.tv/tournaments/temp/images/temp_184446ec9d15437aa349cf8a73a1cb7a",
    "is_club_war_enabled": false,
    "game_name": "FAU-G: Fearless and United Guards"
  },
  {
    "app_support_status": "live",
    "game_id": "-clash-royale",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/60D9F0.png",
    "is_club_war_enabled": true,
    "game_name": "Clash Royale"
  },
  {
    "app_support_status": "live",
    "game_id": "-arena-of-valor",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/E416D8.png",
    "is_club_war_enabled": true,
    "game_name": "AOV"
  },
  {
    "app_support_status": "live",
    "game_id": "-clash-of-clans",
    "icon_url":
        "https://cdn.game.tv/tournaments/temp/images/temp_daff1d41eacd4658be6e857d6559b944",
    "is_club_war_enabled": true,
    "game_name": "Clash of Clans"
  },
  {
    "is_club_war_enabled": true,
    "icon_url":
        "https://cdn.game.tv/tournaments/games/images/lol_wild_rift/LOLWildRift_square.png",
    "game_name": "LOL: Wildrift",
    "app_support_status": "live",
    "game_id": "-league-of-legends:-wild-rift"
  },
  {
    "app_support_status": "live",
    "game_id": "-lost-archive",
    "icon_url":
        "https://cdn.game.tv/tournaments/temp/images/temp_000b1987bf914aaf87c93c2cab5f0ba0",
    "is_club_war_enabled": true,
    "game_name": "Lost Archive"
  },
  {
    "app_support_status": "live",
    "game_id": "-war-robots",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/A3521D.png",
    "is_club_war_enabled": true,
    "game_name": "War Robots"
  },
  {
    "app_support_status": "live",
    "game_id": "-shadowverse",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/971838.png",
    "is_club_war_enabled": true,
    "game_name": "Shadowverse"
  },
  {
    "app_support_status": "live",
    "game_id": "-standoff-2",
    "icon_url":
        "https://cdn.game.tv/tournaments/temp/images/temp_c09df4086270438e809494b8d6be9a07",
    "is_club_war_enabled": true,
    "game_name": "Standoff 2"
  },
  {
    "app_support_status": "live",
    "game_id": "-hearthstone",
    "icon_url": "https://cdn.game.tv/tournaments/engg/game/C3BC93.png",
    "is_club_war_enabled": true,
    "game_name": "Hearthstone"
  }
];
