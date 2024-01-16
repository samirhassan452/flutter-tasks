part of '../utils.exports.dart';

class AppTheme {
  static ThemeData get data => ThemeData(
        fontFamily: AppConfig.appFontType,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary900,
          secondary: AppColor.grey500,
          error: AppColor.error300,
        ),
        scaffoldBackgroundColor: AppColor.scaffoldBackground,
        splashColor: AppColor.primary900.withOpacity(0.05),
        highlightColor: AppColor.primary900.withOpacity(0.01),
        appBarTheme: const AppBarTheme().data,
        inputDecorationTheme: const InputDecorationTheme().data,
        elevatedButtonTheme: const ElevatedButtonThemeData().data,
        textButtonTheme: const TextButtonThemeData().data,
        iconButtonTheme: const IconButtonThemeData().data,
        dropdownMenuTheme: const DropdownMenuThemeData().data,
        menuButtonTheme: const MenuButtonThemeData().data,
        radioTheme: const RadioThemeData().data,
        // menuTheme: const MenuBarThemeData().data,
        useMaterial3: true,
      );
}
