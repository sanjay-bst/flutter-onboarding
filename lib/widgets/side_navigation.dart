import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../router/router.dart';

class SideNavigation extends StatelessWidget {
  final String currentRoute;

  const SideNavigation({Key? key, required this.currentRoute})
      : super(key: key);

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Widget buildListTile({
    required BuildContext context,
    required IconData iconData,
    required String label,
    required String routeName,
  }) {
    return ListTile(
      selected: routeName == currentRoute,
      leading: Icon(
        iconData,
        size: 24,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        if (AppRouter.loginPage == routeName) {
          _logout();
        }
        if (currentRoute != routeName) {
          Navigator.of(context).pushNamed(routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48,
          horizontal: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildListTile(
              context: context,
              iconData: Icons.home,
              label: 'Home',
              routeName: AppRouter.homePage,
            ),
            buildListTile(
              context: context,
              iconData: Icons.notifications,
              label: 'Notifications',
              routeName: AppRouter.notificationsPage,
            ),
            buildListTile(
              context: context,
              iconData: Icons.logout,
              label: 'Logout',
              routeName: AppRouter.loginPage,
            ),
          ],
        ),
      ),
    );
  }
}
