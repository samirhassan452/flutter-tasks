part of 'router.exports.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case RouteName.register:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case RouteName.bottomNavigation:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigationPage(),
        );
      default:
        return MaterialPageRoute(builder: (context) => const PageNotFound());
    }
  }
}
