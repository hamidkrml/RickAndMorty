import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/app/View/AppView.dart';
import 'package:rickandmorty/app/View/Bolumler_View/bolumler_view.dart';
import 'package:rickandmorty/app/View/Karakter_View/karakter_view.dart';
import 'package:rickandmorty/app/View/Konum_View/konum_view.dart';
import 'package:rickandmorty/app/View/Favori_View/favori_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const String characters = '/characters';
  static const String favorites = '/favorites';
  static const String locations = '/locations';
  static const String home = '/';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          Appview(navigationShell: navigationShell),

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.characters,
              builder: (context, state) => const KarakterView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (context, state) => const FavoriView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.locations,
              builder: (context, state) => const KonumView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const BolumlerView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
