import 'package:flutter/material.dart';

class AppTheme {
  // Dark Theme - Material 3 Expressive
  static ThemeData get darkTheme {
    const primaryDark = Color(0xFFD0BCFF);
    const onPrimaryDark = Color(0xFF381E72);
    const primaryContainerDark = Color(0xFF4F378B);
    const onPrimaryContainerDark = Color(0xFFEADDFF);
    const secondaryDark = Color(0xFFCCC2DC);
    const onSecondaryDark = Color(0xFF332D41);
    const secondaryContainerDark = Color(0xFF4A4458);
    const onSecondaryContainerDark = Color(0xFFE8DEF8);
    const tertiaryDark = Color(0xFFEFB8C8);
    const onTertiaryDark = Color(0xFF492532);
    const tertiaryContainerDark = Color(0xFF633B48);
    const surfaceDark = Color(0xFF1C1B1F);
    const outlineDark = Color(0xFF999389);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: primaryDark,
        onPrimary: onPrimaryDark,
        primaryContainer: primaryContainerDark,
        onPrimaryContainer: onPrimaryContainerDark,
        secondary: secondaryDark,
        onSecondary: onSecondaryDark,
        secondaryContainer: secondaryContainerDark,
        onSecondaryContainer: onSecondaryContainerDark,
        tertiary: tertiaryDark,
        onTertiary: onTertiaryDark,
        tertiaryContainer: tertiaryContainerDark,
        surface: surfaceDark,
        outline: outlineDark,
      ),
      scaffoldBackgroundColor: surfaceDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceDark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: primaryDark,
          fontSize: 24,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.5,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF2B2930),
        indicatorColor: const Color(0xFFEADDFF),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: primaryDark,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryContainerDark,
          foregroundColor: onPrimaryContainerDark,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.3,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryDark,
          side: const BorderSide(color: primaryDark, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  // Light Theme - Material 3 Expressive
  static ThemeData get lightTheme {
    const primaryLight = Color(0xFF7D5260);
    const onPrimaryLight = Color(0xFFFFFFFF);
    const primaryContainerLight = Color(0xFFFFD8E4);
    const onPrimaryContainerLight = Color(0xFF31111D);
    const secondaryLight = Color(0xFF625B71);
    const onSecondaryLight = Color(0xFFFFFFFF);
    const secondaryContainerLight = Color(0xFFE8DEF8);
    const onSecondaryContainerLight = Color(0xFF1E192B);
    const tertiaryLight = Color(0xFF7D5260);
    const onTertiaryLight = Color(0xFFFFFFFF);
    const tertiaryContainerLight = Color(0xFFFFD8E4);
    const surfaceLight = Color(0xFFFFFBFE);
    const outlineLight = Color(0xFF79747E);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primaryLight,
        onPrimary: onPrimaryLight,
        primaryContainer: primaryContainerLight,
        onPrimaryContainer: onPrimaryContainerLight,
        secondary: secondaryLight,
        onSecondary: onSecondaryLight,
        secondaryContainer: secondaryContainerLight,
        onSecondaryContainer: onSecondaryContainerLight,
        tertiary: tertiaryLight,
        onTertiary: onTertiaryLight,
        tertiaryContainer: tertiaryContainerLight,
        surface: surfaceLight,
        outline: outlineLight,
      ),
      scaffoldBackgroundColor: surfaceLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceLight,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: primaryLight,
          fontSize: 24,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.5,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFF5EFF7),
        indicatorColor: primaryContainerLight,
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: primaryLight,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryLight,
          foregroundColor: onPrimaryLight,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.3,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryLight,
          side: const BorderSide(color: primaryLight, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
