import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/tournaments.dart';

class Stats extends StatelessWidget {
  final Tournaments tournaments;

  Stats(this.tournaments);

  String format(val) {
    if (0 <= val && val <= 9) {
      return '0$val';
    }
    return '$val';
  }

  Widget getWidget(index) {
    final double topLeft = index == 0 ? 20 : 0;
    final double topRight = index == 2 ? 20 : 0;
    final double bottomLeft = index == 0 ? 20 : 0;
    final double bottomRight = index == 2 ? 20 : 0;

    final List<String> count = [
      format(tournaments.tournamentsPlayed),
      format(tournaments.tournamentsWon),
      format(tournaments.winPercentage),
    ];

    final List<String> labels = [
      'Tournaments played',
      'Tournaments won',
      'Winning percentage',
    ];

    final List<List<Color>> colors = [
      [
        const Color.fromRGBO(237, 170, 0, 1),
        const Color.fromRGBO(226, 113, 0, 1),
      ],
      [
        const Color.fromRGBO(60, 31, 148, 1),
        const Color.fromRGBO(171, 88, 192, 1),
      ],
      [
        const Color.fromRGBO(239, 131, 81, 1),
        const Color.fromRGBO(236, 80, 67, 1),
      ]
    ];

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
          ),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: colors[index],
          ),
        ),
        height: 74,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 17,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              count[index] + (index == 2 ? '%' : ''),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              labels[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 23,
      ),
      child: Row(children: [
        getWidget(0),
        const SizedBox(
          width: 1,
        ),
        getWidget(1),
        const SizedBox(
          width: 1,
        ),
        getWidget(2),
      ]),
    );
  }
}
