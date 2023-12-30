part of '../utils.exports.dart';

enum BottomNavBar {
  home(
    icon: IconPath.home,
    page: HomePage(),
  ),
  integration(
    icon: IconPath.investment,
    page: FixedIncomePage(),
  ),
  ;

  const BottomNavBar({
    required this.icon,
    required this.page,
  });
  final String icon;
  final Widget page;

  String get label => name.toTitleCase();
}
