part of '../utils.exports.dart';

class AppConfig {
  static const String appFontType = 'Lato';

  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration shortDelayDuration = Duration(milliseconds: 500);
  static const Duration longDelayDuration = Duration(milliseconds: 1500);

  static const double annualYield = 6.81;
  static const List<int> yearTerms = [3, 5];
  static final int initialYearTerm = yearTerms.first;
  static const double minimumAmount = 1000.0;
  static const double initialAmount = 10000.0;
  static const double threshold = 250.0;
}
