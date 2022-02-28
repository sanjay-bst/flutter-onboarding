import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/router.dart';
import '../widgets/app_bar.dart';
import '../widgets/side_navigation.dart';
import '../cubit/notifications_cubit.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _getNotificationTile(
    int index,
    String title,
    String imageUrl,
    DateTime date,
  ) {
    return Container(
      margin: EdgeInsets.only(
        top: index == 0 ? 0 : 20,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 26, 121, 0.08),
            offset: Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => const SizedBox(
                      width: 96,
                      height: 96,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(100, 112, 147, 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '19 minutes ago',
            style: TextStyle(
              color: Color.fromRGBO(177, 186, 212, 1),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotificationsCubit>(context).fetchNotifications();

    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is! NotificationsLoaded) {
          return Scaffold(
            body: Center(
              child: state is NotificationsInitial
                  ? const CircularProgressIndicator()
                  : const Center(
                      child: Text('Something went wrong!'),
                    ),
            ),
          );
        }

        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            titleText: 'Notifications',
          ),
          drawer: const SideNavigation(
            currentRoute: AppRouter.notificationsPage,
          ),
          body: Center(
            child: Center(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 30,
                ),
                itemBuilder: (_, index) {
                  return _getNotificationTile(
                    index,
                    state.notifications[index].title,
                    state.notifications[index].imageUrl,
                    state.notifications[index].date,
                  );
                },
                itemCount: state.notifications.length,
              ),
            ),
          ),
        );
      },
    );
  }
}
