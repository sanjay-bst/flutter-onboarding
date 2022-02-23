import 'package:flutter_app/data/services/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/notification.dart';
import '../models/user_details.dart';
import '../services/network.dart';

class Repository {
  final NetworkService _networkService;
  final FirebaseService _firebaseService;

  Repository(this._networkService, this._firebaseService);

  Future<UserDetails> fetchUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');
    final token = prefs.getString('token');

    final userDetails = await _networkService.fetchUserDetails(userId, token);

    return UserDetails.fromJson(userDetails);
  }

  Future<List<Notification>> fetchNotifications() async {
    final notifications = await _firebaseService.fetchNotifications();

    try {
      List<Notification> listOfNotifications = [];

      notifications.forEach(
        (item) => listOfNotifications.add(
          Notification.fromJson(item),
        ),
      );

      return listOfNotifications;
    } catch (e) {
      return [];
    }
  }
}
