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
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _controller.addStatusListener(onAnimationStatusListener);
    // });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    // _controller.removeStatusListener(onAnimationStatusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EntryPointCubit, EntryPointState>(
      listener: (_, state) {
        _controller.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            switch (state.status) {
              case BlocStatus.getFailure:
                onGoToLogin();
                break;
              case BlocStatus.getSuccess:
                onGoToHome();
                break;
              default:
                break;
            }
          }
        });
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: Center(
          child: JelloIn(
            controller: (controller) => _controller = controller,
            duration: const Duration(milliseconds: 1200),
            child: Image.asset(
              IconPath.kafiilLogo,
              scale: MediaQuery.of(context).size.shortestSide / 100,
            ),
          ),
        ),
      ),
    );
  }

  /* void onAnimationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(const Duration(milliseconds: 100), onGoToHome);
    }
  } */

  void onGoToHome() =>
      Navigator.of(context).pushReplacementNamed(RouteName.bottomNavigation);
  void onGoToLogin() =>
      Navigator.of(context).pushReplacementNamed(RouteName.login);
}
