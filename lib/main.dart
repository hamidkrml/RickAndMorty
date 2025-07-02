import 'package:flutter/material.dart';
import 'package:rickandmorty/app/Thema/thema.dart';
import 'package:rickandmorty/app/View/AppView.dart';
import 'package:rickandmorty/app/router.dart';

void main() => runApp(const MyApp());

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
