import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/user_details.dart';

class Stats extends StatelessWidget {
  final UserDetails _userDetails;
  late List<dynamic> _data;

  Stats(this._userDetails, {Key? key}) : super(key: key) {
    _data = [
      {
        'label': 'Tournaments played',
        'color': [
          const Color.fromRGBO(237, 170, 0, 1),
          const Color.fromRGBO(226, 113, 0, 1),
        ],
        'count': _format(_userDetails.tournamentsPlayed),
        'topLeft': 20.0,
        'bottomLeft': 20.0,
      },
      {
        'label': 'Tournaments won',
        'color': [
          const Color.fromRGBO(60, 31, 148, 1),
          const Color.fromRGBO(171, 88, 192, 1),
        ],
        'count': _format(_userDetails.tournamentsWon),
      },
      {
        'label': 'Winning percentage',
        'color': [
          const Color.fromRGBO(239, 131, 81, 1),
          const Color.fromRGBO(236, 80, 67, 1),
        ],
        'count': _format(_userDetails.tournamentsPlayed),
        'topRight': 20.0,
        'bottomRight': 20.0,
      }
    ];
  }

  String _format(val) {
    if (0 <= val && val <= 9) {
      return '0$val';
    }
    return '$val';
  }

  Widget _getWidget(index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: index == 1 ? 1 : 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              _data[index]['topLeft'] ?? 0,
            ),
            topRight: Radius.circular(
              _data[index]['topRight'] ?? 0,
            ),
            bottomLeft: Radius.circular(
              _data[index]['bottomLeft'] ?? 0,
            ),
            bottomRight: Radius.circular(
              _data[index]['bottomRight'] ?? 0,
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: _data[index]['color'],
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
              _data[index]['count'] + (index == 2 ? '%' : ''),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              _data[index]['label'],
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
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      margin: const EdgeInsets.only(
        top: 23,
      ),
      child: Row(children: [
        _getWidget(0),
        _getWidget(1),
        _getWidget(2),
      ]),
    );
  }
}
