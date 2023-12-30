part of '../utils.exports.dart';

class AppStyle {
  static const blackFont = TextStyle(
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w900,
    color: AppColor.black,
  );
  static const boldFont = TextStyle(
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  );
  static const semiBoldFont = TextStyle(
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppColor.black,
  );
  static const mediumFont = TextStyle(
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    color: AppColor.black,
  );
  static const regularFont = TextStyle(
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
  );
  static const lightFont = TextStyle(
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    color: AppColor.black,
  );

  //! Use Cases
  static final appBar = boldFont.copyWith(
    fontSize: 20.0,
    height: 1.4,
    color: AppColor.primary4,
  );
  static final bottomNavigation = mediumFont.copyWith(
    fontSize: 12.0,
    height: 1.66667, // This corresponds to line-height: 20px
    letterSpacing: -0.24,
  );
  static final elevatedButton = boldFont.copyWith(
    color: AppColor.white,
  );

  static const boxShadow = BoxShadow(
    color: AppColor.cardShadow,
    offset: Offset(4.0, 10.0),
    blurRadius: 40.0,
    spreadRadius: 0.0,
  );
}
