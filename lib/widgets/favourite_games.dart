import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/models/game.dart';

class FavouriteGames extends StatelessWidget {
  final List<Game> _favouriteGames;

  const FavouriteGames(this._favouriteGames, {Key? key}) : super(key: key);

  Widget getApp(index) {
    return Column(
      children: [
        SizedBox(
          height: 132,
          width: 96,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 26, 121, 0.08),
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: _favouriteGames[index].iconUrl,
                    placeholder: (context, url) => const SizedBox(
                      width: 96,
                      height: 96,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Flexible(
                child: Text(
                  _favouriteGames[index].name,
                  style: const TextStyle(
                    color: Color.fromRGBO(45, 45, 51, 1),
                    fontSize: 14,
                  ),
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
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: const Text(
              'Favourite games',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 132,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: _favouriteGames.length,
              itemBuilder: (context, index) {
                return getApp(index);
              },
              separatorBuilder: (_, __) => const SizedBox(
                width: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
