part of '../utils.exports.dart';

extension StrConversion on String {
  String toTitleCase() {
    // Split the input string into words
    List<String> words = split(RegExp(r'(?=[A-Z])|[_]'));

    // Capitalize the first letter of each word
    for (int i = 0; i < words.length; i++) {
      words[i] = words[i][0].toUpperCase() + words[i].substring(1);
    }

    // Join the words with spaces to form the final title case string
    return words.join(' ');
  }

  String toCapitalized() {
    if (trim().isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  DateTime fromDateFormate() => DateFormat(AppConfig.dateFormat).parse(this);
}

extension DateTimeConversion on DateTime {
  String toDateFormat() => DateFormat(AppConfig.dateFormat).format(this);
}
