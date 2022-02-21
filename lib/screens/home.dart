import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/user.dart';
import '../widgets/stats.dart';
import '../cubit/tournaments_cubit.dart';
import '../widgets/favourite_games.dart';
import '../widgets/side_navigation.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = GlobalKey<ScaffoldState>();

    BlocProvider.of<TournamentsCubit>(context).fetchTournaments();

    return BlocBuilder<TournamentsCubit, TournamentsState>(
      builder: (context, state) {
        if (state is! TournamentsLoaded) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Text(
                state.tournaments.userHandler,
                style: const TextStyle(
                  color: Color.fromRGBO(45, 45, 51, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            leading: Center(
              child: IconButton(
                icon: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromRGBO(45, 45, 51, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 5.5,
                    ),
                    Container(
                      height: 2,
                      width: 18,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromRGBO(45, 45, 51, 1),
                      ),
                    )
                  ],
                ),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
            ),
          ),
          drawer: SideNavigation(),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  User(state.tournaments),
                  Stats(state.tournaments),
                  FavouriteGames(state.tournaments),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
