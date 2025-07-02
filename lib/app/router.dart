import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/app/View/AppView.dart';

final _routerKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          Appview(navigationShell: navigationShell),

      branches: [StatefulShellBranch(navigatorKey: _routerKey, routes: [

          ],
          
          )],
    ),
  ],
);
