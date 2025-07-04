import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/app/View/AppView.dart';
import 'package:rickandmorty/app/View/screens/Bolumler_View/bolumler_view.dart';
import 'package:rickandmorty/app/View/screens/Favori_View/favori_viewmodel.dart';
import 'package:rickandmorty/app/View/screens/Karakter_View/karakter_view.dart';
import 'package:rickandmorty/app/View/screens/Konum_View/konum_view.dart';
import 'package:rickandmorty/app/View/screens/Favori_View/favori_view.dart';
import 'package:rickandmorty/app/View/screens/Karakter_View/karakter_viewmodel.dart';
import 'package:rickandmorty/app/View/screens/karakter_profilview/karakter_profilView.dart.dart';
import 'package:rickandmorty/models/karakter_model.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const String characters = '/';
  static const String favorites = '/favorites';
  static const String locations = '/locations';
  static const String home = '/home';

  static const String charactersProfile = 'characterprofile';
  static const String charactersProfilePage = '/characterprofile';
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
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => KarakterViewmodel(),
                child: const KarakterView(),
              ),
              routes: [
                GoRoute(
                  path: AppRoutes.charactersProfile,
                  builder: (context, state) => KarakterProfilview(
                    gelenveri: state.extra as KarakterInfo,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => FavoriViewmodel(),
                child: const FavoriView(),
              ),
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
