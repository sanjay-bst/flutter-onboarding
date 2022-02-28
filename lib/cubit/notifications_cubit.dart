import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/notification.dart';
import '../data/repositories/repository.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final Repository repository;

  NotificationsCubit(this.repository) : super(NotificationsInitial());

  void fetchNotifications() async {
    try {
      final List<Notification> notifications =
          await repository.fetchNotifications();
      emit(NotificationsLoaded(notifications));
    } catch (err) {
      emit(NotificationsError());
    }
  }
}
