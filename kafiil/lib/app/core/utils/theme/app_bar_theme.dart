part of '../utils.exports.dart';

extension AppBarThemeConversion on AppBarTheme {
  AppBarTheme get data => const AppBarTheme(
        centerTitle: false,
        elevation: 0.0,
        scrolledUnderElevation: 1.0,
        titleSpacing: 20.0,
        // iconTheme: IconThemeData(size: 18.0),
        titleTextStyle: AppStyle.appBar,
        shadowColor: AppColor.primary900,
        backgroundColor: AppColor.scaffoldBackground,
      );
}
