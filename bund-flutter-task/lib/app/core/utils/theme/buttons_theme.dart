part of '../utils.exports.dart';

class ButtonsTheme {
  static ElevatedButtonThemeData get elevated => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56.0),
          padding: const EdgeInsets.all(10.0),
          backgroundColor: AppColor.primary,
          disabledBackgroundColor: AppColor.textQuaternary,
          foregroundColor: AppColor.white,
          disabledForegroundColor: AppColor.textQuaternary,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          alignment: AlignmentDirectional.center,
          elevation: 2.0,
        ),
      );

  static IconButtonThemeData get icon => IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: AppColor.iconButtonBackground,
          foregroundColor: AppColor.primary,
          // highlightColor: AppColor.green,
          elevation: 4.0,
          minimumSize: const Size.square(40.0),
          padding: EdgeInsets.zero,
          shadowColor: AppColor.iconButtonShadow,
        ),
      );
}
