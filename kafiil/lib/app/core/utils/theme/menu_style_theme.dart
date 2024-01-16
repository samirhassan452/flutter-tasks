part of '../utils.exports.dart';

/* extension MenuBarThemeDataConversion on MenuBarThemeData {
  MenuBarThemeData get data => MenuBarThemeData(
        style: MenuStyle(
          backgroundColor:
              const MaterialStatePropertyAll<Color>(AppColor.grey50),
          surfaceTintColor:
              const MaterialStatePropertyAll<Color>(AppColor.primary900),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
        ),
      );
} */

extension DropdownMenuThemeDataConversion on DropdownMenuThemeData {
  DropdownMenuThemeData get data => DropdownMenuThemeData(
        textStyle: AppStyle.inputValue,
        inputDecorationTheme: const InputDecorationTheme().data,
        menuStyle: MenuStyle(
          backgroundColor:
              const MaterialStatePropertyAll<Color>(AppColor.grey50),
          surfaceTintColor:
              const MaterialStatePropertyAll<Color>(AppColor.primary900),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
        ),
      );
}
