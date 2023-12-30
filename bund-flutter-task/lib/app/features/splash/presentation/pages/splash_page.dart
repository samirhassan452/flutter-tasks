part of '../../splash.exports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.addStatusListener(onAnimationStatusListener);
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    _controller.removeStatusListener(onAnimationStatusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: JelloIn(
          controller: (controller) => _controller = controller,
          duration: const Duration(milliseconds: 1200),
          child: Image.asset(IconPath.logo, scale: 1.5),
        ),
      ),
    );
  }

  void onAnimationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(const Duration(milliseconds: 100), onGoToHome);
    }
  }

  void onGoToHome() =>
      Navigator.of(context).pushReplacementNamed(RouteName.bottomNavigation);
}
