part of '../utils.exports.dart';

extension InputDecorationThemeConversion on InputDecorationTheme {
  InputDecorationTheme get data => const InputDecorationTheme(
        // constraints: BoxConstraints.tight(const Size.fromHeight(56.0)),
        constraints: BoxConstraints(
          minHeight: 56.0,
          minWidth: 120.0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
        ),
        filled: true,
        fillColor: AppColor.grey50,
        errorStyle: AppStyle.inputError,
        errorMaxLines: 3,
        contentPadding: EdgeInsets.all(20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide(color: AppColor.error300),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide(color: AppColor.error300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide(color: AppColor.primary900),
        ),
      );
}
