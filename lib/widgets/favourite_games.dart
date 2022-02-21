import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/models/tournaments.dart';

class FavouriteGames extends StatelessWidget {
  final Tournaments tournaments;

  FavouriteGames(this.tournaments);

  Widget getApp(index) {
    return Column(
      children: [
        SizedBox(
          height: 132,
          width: 96,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: CachedNetworkImage(
                  imageUrl: tournaments.favoriteGames[index]['icon_url'],
                  placeholder: (context, url) => const SizedBox(
                    width: 96,
                    height: 96,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                tournaments.favoriteGames[index]['game_name'],
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color.fromRGBO(45, 45, 51, 1),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Favourite games',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 132,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tournaments.favoriteGames.length,
              itemBuilder: (context, index) {
                return getApp(index);
              },
              separatorBuilder: (BuildContext context, _) => const SizedBox(
                width: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
