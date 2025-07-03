import 'package:flutter/material.dart';
import 'package:rickandmorty/app/Thema/thema.dart';

import 'package:rickandmorty/app/Thema/router.dart';
import 'package:rickandmorty/service/getit.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppThema.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
