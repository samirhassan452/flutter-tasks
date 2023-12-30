part of '../utils.exports.dart';

class AppTheme {
  static ThemeData get data => ThemeData(
        fontFamily: AppConfig.appFontType,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
          secondary: AppColor.textSecondary,
        ),
        scaffoldBackgroundColor: AppColor.scaffoldBackground,
        splashColor: AppColor.primary.withOpacity(0.05),
        highlightColor: AppColor.primary.withOpacity(0.01),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          scrolledUnderElevation: 1.0,
          shadowColor: AppColor.green,
          backgroundColor: AppColor.scaffoldBackground,
        ),
        elevatedButtonTheme: ButtonsTheme.elevated,
        iconButtonTheme: ButtonsTheme.icon,
        useMaterial3: true,
      );
}
