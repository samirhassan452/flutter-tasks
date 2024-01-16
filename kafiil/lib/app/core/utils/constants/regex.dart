part of '../utils.exports.dart';

class Regex {
  static final email = RegExp(
    r"^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
  );
  static final password = RegExp(r'^.{8,}');
  static final name = RegExp(r'^[a-zA-Z]{1,50}');
  static final about = RegExp(r"^[a-zA-Zء-ي0-9٠-٩ ]{10,1000}");
}
