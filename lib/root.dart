import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './router/router.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();

    authenticateUser();
  }

  Future authenticateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');
    final token = prefs.getString('token');

    setState(() {
      if (userId != null && token != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRouter.homePage,
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.of(context).pushNamed(AppRouter.loginPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
