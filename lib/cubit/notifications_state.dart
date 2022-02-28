part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsError extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  final List<Notification> notifications;

  NotificationsLoaded(this.notifications);
}
