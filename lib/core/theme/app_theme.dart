import 'package:flutter/material.dart';
import 'package:ish_topdim/core/theme/themes.dart';

sealed class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Themes.white,
    colorScheme: const ColorScheme.light(
      primary: Themes.orange,
      secondary: Themes.black57,
      background: Themes.white,
      surface: Themes.white,
      onPrimary: Themes.white,
      onSecondary: Themes.white,
      onBackground: Themes.black57,
      onSurface: Themes.black57,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,

      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Themes.orange,
        foregroundColor: Themes.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Themes.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Themes.black57),
      displayMedium: TextStyle(color: Themes.black57),
      displaySmall: TextStyle(color: Themes.black57),
      headlineLarge: TextStyle(color: Themes.black57),
      headlineMedium: TextStyle(color: Themes.black57),
      headlineSmall: TextStyle(color: Themes.black57),
      titleLarge: TextStyle(color: Themes.black57),
      titleMedium: TextStyle(color: Themes.black57),
      titleSmall: TextStyle(color: Themes.black57),
      bodyLarge: TextStyle(color: Themes.black57),
      bodyMedium: TextStyle(color: Themes.black57),
      bodySmall: TextStyle(color: Themes.black57),
    ),
    dividerTheme: const DividerThemeData(
      color: Themes.grey,
      thickness: 1,
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Themes.black57,
    colorScheme: const ColorScheme.dark(
      primary: Themes.orange,
      secondary: Themes.white57,
      background: Themes.black57,
      surface: Themes.black57,
      onPrimary: Themes.white,
      onSecondary: Themes.black57,
      onBackground: Themes.white,
      onSurface: Themes.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Themes.orange,
        foregroundColor: Themes.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF173755),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Themes.white),
      displayMedium: TextStyle(color: Themes.white),
      displaySmall: TextStyle(color: Themes.white),
      headlineLarge: TextStyle(color: Themes.white),
      headlineMedium: TextStyle(color: Themes.white),
      headlineSmall: TextStyle(color: Themes.white),
      titleLarge: TextStyle(color: Themes.white),
      titleMedium: TextStyle(color: Themes.white),
      titleSmall: TextStyle(color: Themes.white),
      bodyLarge: TextStyle(color: Themes.white),
      bodyMedium: TextStyle(color: Themes.white),
      bodySmall: TextStyle(color: Themes.white),
    ),
    dividerTheme: const DividerThemeData(
      color: Themes.grey,
      thickness: 1,
    ),
  );
}