part of '../utils.exports.dart';

extension DoubleConversion on double {
  double toPrecision([int precision = 1]) {
    return double.parse(toStringAsFixed(precision));
  }

  String toFormatPrice() {
    // Create a NumberFormat instance for currency formatting
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'en_US', symbol: '\$');

    // Format the price using the currency format
    String formattedPrice = currencyFormat.format(this);

    // If the price is a whole number, remove the decimal part
    if (int.parse(formattedPrice.split('.').last) == 0) {
      formattedPrice = formattedPrice.split('.').first;
    }

    return formattedPrice;
  }
}
