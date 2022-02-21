import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/app_bar.dart';
import '../widgets/user.dart';
import '../widgets/stats.dart';
import '../cubit/user_details_cubit.dart';
import '../widgets/favourite_games.dart';
import '../widgets/side_navigation.dart';
import '../router/router.dart';

class Home extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserDetailsCubit>(context).fetchUserDetails();

    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (context, state) {
        if (state is! UserDetailsLoaded) {
          return Scaffold(
            body: Center(
              child: state is UserDetailsInitial
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
            titleText: state.userDetails.userHandler,
          ),
          drawer: const SideNavigation(currentRoute: AppRouter.homePage),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                User(state.userDetails),
                Stats(state.userDetails),
                FavouriteGames(state.userDetails),
              ],
            ),
          ),
        );
      },
    );
  }
}
