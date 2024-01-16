part of '../utils.exports.dart';

extension ElevatedButtonThemeConversion on ElevatedButtonThemeData {
  ElevatedButtonThemeData get data => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56.0),
          padding: const EdgeInsets.all(20.0),
          backgroundColor: AppColor.primary900,
          foregroundColor: AppColor.white,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          alignment: AlignmentDirectional.center,
          elevation: 2.0,
          textStyle: AppStyle.elevatedButton,
        ),
      );
}

extension TextButtonThemeConversion on TextButtonThemeData {
  TextButtonThemeData get data => TextButtonThemeData(
        style: TextButton.styleFrom(
          // minimumSize: Size(double.minPositive, 15.0),
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          visualDensity: VisualDensity.compact,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColor.grey500,
          shadowColor: Colors.transparent,
          alignment: AlignmentDirectional.center,
          elevation: 0.0,
          textStyle: AppStyle.textButton,
        ),
      );
}

extension IconButtonThemeConversion on IconButtonThemeData {
  IconButtonThemeData get data => IconButtonThemeData(
        style: IconButton.styleFrom(
          iconSize: 18.0,
          minimumSize: const Size(8.0, 15.0),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColor.grey900,
          shadowColor: Colors.transparent,
          highlightColor: Colors.transparent,
          shape: const CircleBorder(),
          alignment: AlignmentDirectional.center,
          elevation: 2.0,
        ),
      );
}

extension MenuButtonThemeDataConversion on MenuButtonThemeData {
  MenuButtonThemeData get data => MenuButtonThemeData(
        style: MenuItemButton.styleFrom(
          foregroundColor: AppColor.grey800,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          // splashFactory: NoSplash.splashFactory,
          textStyle: AppStyle.inputValue,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          minimumSize: const Size.fromHeight(56.0),
          elevation: 2.0,
        ),
      );
}

extension RadioThemeDataConversion on RadioThemeData {
  RadioThemeData get data => RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColor.primary900;
          }
          return AppColor.grey300;
        }),
      );
}
