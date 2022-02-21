import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/tournaments_cubit.dart';
import 'package:flutter_app/data/repositories/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './screens/login.dart';
import './screens/home.dart';
import './data/services/network.dart';
import './root.dart';
import '../screens/notifications.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late Repository repository;

  MyApp({Key? key}) : super(key: key) {
    repository = Repository(NetworkService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game.tv',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Root(),
      routes: {
        Home.routeName: (context) => BlocProvider(
              create: (BuildContext context) => TournamentsCubit(repository),
              child: Home(),
            ),
        Login.routeName: (context) => const Login(),
        Notifications.routeName: (context) => Notifications()
      },
    );
  }
}
