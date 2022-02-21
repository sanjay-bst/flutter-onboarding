import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home.dart';
import '../screens/login.dart';
import '../screens/notifications.dart';

class SideNavigation extends StatelessWidget {
  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    Navigator.of(context).pushNamed(Login.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48,
          horizontal: 18,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 24,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              if (currentRoute == Home.routeName) {
                Navigator.of(context).pop();
                return;
              }

              Navigator.of(context).pushNamedAndRemoveUntil(
                  Home.routeName, (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications,
              size: 24,
            ),
            title: const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              if (currentRoute == Notifications.routeName) {
                Navigator.of(context).pop();
                return;
              }

              Navigator.of(context).pushNamed(Notifications.routeName);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () => logout(context),
          ),
        ]),
      ),
    );
  }
}
