import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../widgets/side_navigation.dart';
import '../data/services/firebase.dart';

class Notifications extends StatefulWidget {
  static const routeName = '/notifications';

  Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseServie _firebaseService = FirebaseServie();

  @override
  void initState() {
    super.initState();

    Firebase.initializeApp().whenComplete(() async {
      final notificationsList = await _firebaseService.getNotifications();
      print(notificationsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Text(
            'Notifications',
            style: TextStyle(
              color: Color.fromRGBO(45, 45, 51, 1),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Center(
          child: IconButton(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 2,
                  width: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(45, 45, 51, 1),
                  ),
                ),
                const SizedBox(
                  height: 5.5,
                ),
                Container(
                  height: 2,
                  width: 18,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(45, 45, 51, 1),
                  ),
                )
              ],
            ),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ),
      ),
      drawer: SideNavigation(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: const Center(
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
