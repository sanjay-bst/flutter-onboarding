import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/notifications_cubit.dart';
import 'package:flutter_app/cubit/user_details_cubit.dart';
import 'package:flutter_app/data/repositories/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home.dart';
import '../screens/login.dart';
import '../screens/notifications.dart';
import '../data/services/network.dart';
import '../data/services/firebase.dart';

class AppRouter {
  static const homePage = '/home';
  static const loginPage = '/login';
  static const notificationsPage = '/notifications';

  late Repository _repository;

  AppRouter({Key? key}) {
    _repository = Repository(NetworkService(), FirebaseService());
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );

      case homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => UserDetailsCubit(_repository),
            child: Home(),
          ),
        );

      case notificationsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => NotificationsCubit(_repository),
            child: const Notifications(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Center(
            child: Text('Invalid route'),
          ),
        );
    }
  }
}
