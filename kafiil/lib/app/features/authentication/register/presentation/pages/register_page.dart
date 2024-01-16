part of '../../register.exports.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late PageController _pageController;
  late ScrollController _scrollController;

  @override
  void initState() {
    _pageController = PageController(initialPage: RegisterSteps.register.index);
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StepperCubit>(create: (_) => StepperCubit()),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
        BlocProvider<RegisterStep1Bloc>(
          create: (context) => RegisterStep1Bloc(
            stepperCubit: context.read<StepperCubit>(),
            registerBloc: context.read<RegisterBloc>(),
          )..add(RegisterStep1OnGetInfo()),
        ),
        BlocProvider<RegisterStep2Bloc>(
          create: (context) => RegisterStep2Bloc(
            registerBloc: context.read<RegisterBloc>(),
            registerStep1Bloc: context.read<RegisterStep1Bloc>(),
          )..add(RegisterStep2OnGetInfo()),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiBlocListener(
          listeners: [
            BlocListener<StepperCubit, int>(
              listener: (_, currentStep) => _onGoTo(currentStep),
            ),
            BlocListener<RegisterStep1Bloc, RegisterStep1State>(
              listener: (_, state) {
                if (state.isValidationFailed) _animateToTop();
              },
            ),
            BlocListener<RegisterStep2Bloc, RegisterStep2State>(
              listener: (_, state) {
                if (state.isValidationFailed) _animateToTop();
              },
            ),
          ],
          child: RegisterBodyWidget(
            pageController: _pageController,
            scrollController: _scrollController,
          ),
        ),
        bottomNavigationBar: const RegisterFooterWidget(),
      ),
    );
  }

  void _onGoTo(int step) => _pageController.animateToPage(
        step,
        duration: AppConfig.animationDuration,
        curve: Curves.easeInOut,
      );
  void _animateToTop() => _scrollController.animateTo(
        5.0,
        duration: AppConfig.animationDuration,
        curve: Curves.bounceIn,
      );
}
