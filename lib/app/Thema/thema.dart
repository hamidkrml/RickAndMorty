import 'package:flutter/material.dart';

class AppThema {
  AppThema._();

  /// disiradin nesne olustura bilmesin  dege private yapmak icin  AppThema._(); kullanilir

  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Inter',
    scaffoldBackgroundColor: Colors.white,

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF42BACA),
      secondary: Color.fromARGB(255, 201, 249, 255),
      surface: Colors.white,
      onSurface: Color(0xFF414A4C),
      error: Color(0xFF414A4C),
      tertiary: Color(0xFFB5C4C7),
    ),

    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: const Color(0xFF42BACA)),
    ),
  );
}
