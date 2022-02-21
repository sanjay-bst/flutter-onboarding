import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServie {
  Future getNotifications() async {
    final CollectionReference notifications =
        FirebaseFirestore.instance.collection('notificatioins');

    try {
      QuerySnapshot querySnapshot = await notifications.get();

      final notificationsList =
          querySnapshot.docs.map((e) => e.data()).toList();
      print(notificationsList);
    } catch (e) {
      print(e);
      return e;
    }
  }
}
