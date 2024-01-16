part of '../utils.exports.dart';

class AppStyle {
  static const blackFont = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w900,
    color: AppColor.black,
    wordSpacing: 1.0,
  );
  static const boldFont = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
    wordSpacing: 1.0,
  );
  static const semiBoldFont = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppColor.black,
    wordSpacing: 1.0,
  );
  static const mediumFont = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    color: AppColor.black,
    wordSpacing: 1.0,
  );
  static const regularFont = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
    wordSpacing: 1.0,
  );
  static const lightFont = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    color: AppColor.black,
    wordSpacing: 1.0,
  );

  //! Use Cases
  static const appBar = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    wordSpacing: 1.0,
    fontSize: 18.0,
    height: 20.0 / 18.0,
    color: AppColor.grey900,
  );
  static const elevatedButton = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    wordSpacing: 1.0,
    color: AppColor.white,
    fontSize: 15.0,
    height: 15.0 / 14.0,
  );
  static const textButton = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    wordSpacing: 1.0,
    color: AppColor.grey500,
    fontSize: 12.0,
    height: 13.0 / 12.0,
  );
  static const inputLabel = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    wordSpacing: 1.0,
    color: AppColor.grey500,
    fontSize: 12.0,
    height: 13.0 / 12.0,
  );
  static const inputValue = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    wordSpacing: 1.0,
    color: AppColor.grey800,
    fontSize: 16.0,
    height: 17.0 / 16.0,
  );
  static const inputError = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    wordSpacing: 1.0,
    color: AppColor.error300,
    fontSize: 12.0,
    height: 13.0 / 12.0,
  );
  static const tableColumn = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    wordSpacing: 1.0,
    color: AppColor.grey500,
    fontSize: 12.0,
    height: 13.0 / 12.0,
  );
  static const tableRow = TextStyle(
    fontFamily: AppConfig.appFontType,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    wordSpacing: 1.0,
    color: AppColor.grey900,
    fontSize: 12.0,
    height: 13.0 / 12.0,
  );
  static final bottomNavigation = regularFont.copyWith(
    fontSize: 12.0,
    height: 13.0 / 12.0,
  );
  static final service = mediumFont.copyWith(
    color: AppColor.grey900,
    fontSize: 11.0,
    height: 17.0 / 11.0,
    letterSpacing: 0.22,
  );
}
