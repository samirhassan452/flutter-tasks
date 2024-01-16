part of '../utils.exports.dart';

enum BottomNavBar {
  whoAmI(
    icon: IconPath.userCircle,
    activeIcon: IconPath.userCircleSelected,
    page: WhoAmIPage(),
  ),
  countries(
    icon: IconPath.globeHemisphereWest,
    activeIcon: IconPath.globeHemisphereWestSelected,
    page: CountriesPage(),
  ),
  services(
    icon: IconPath.shoppingCartSimple,
    activeIcon: IconPath.shoppingCartSimpleSelected,
    page: ServicesPage(),
  ),
  ;

  const BottomNavBar({
    required this.icon,
    required this.activeIcon,
    required this.page,
  });
  final String icon;
  final String activeIcon;
  final Widget page;

  String get label => name.toTitleCase();
}
