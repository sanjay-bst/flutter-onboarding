import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../data/models/tournaments.dart';

class User extends StatelessWidget {
  final Tournaments tournaments;

  User(this.tournaments);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 25,
      ),
      child: Row(children: [
        SizedBox(
          height: 80,
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CachedNetworkImage(
              imageUrl: tournaments.avatarUrl,
              placeholder: (context, url) => const SizedBox(
                width: 80,
                height: 80,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tournaments.userName,
              style: const TextStyle(
                color: Color.fromRGBO(45, 45, 51, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Row(children: [
                Text(
                  '${tournaments.overallRating}',
                  style: const TextStyle(
                    color: Color.fromRGBO(66, 107, 255, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Elo rating',
                  style: TextStyle(
                    color: Color.fromRGBO(100, 112, 147, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromRGBO(66, 107, 255, 1),
                  size: 16,
                ),
              ]),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromRGBO(66, 107, 255, 1),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                primary: Colors.teal,
              ),
              // style: ButtonStyle(
              //   shape: MaterialStateProperty.all(
              //     RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //   ),
              // ),
            )
          ],
        )
      ]),
    );
  }
}
