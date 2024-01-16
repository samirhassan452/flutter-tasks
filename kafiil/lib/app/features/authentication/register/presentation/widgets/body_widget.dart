part of '../../register.exports.dart';

class RegisterBodyWidget extends StatelessWidget {
  final PageController pageController;
  final ScrollController scrollController;
  const RegisterBodyWidget({
    super.key,
    required this.pageController,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: scrollController,
      physics: const PageScrollPhysics(),
      headerSliverBuilder: (context, headerSliverBuilder) => [
        const RegisterHeaderWidget(),
        const RegisterValidationErrorWidget(),
        // Stepper
        BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (_, curr) => curr.reloadPage,
          builder: (_, state) => switch (state.status) {
            BlocStatus.getLoading ||
            BlocStatus.getFailure =>
              const SliverToBoxAdapter(child: SizedBox.square(dimension: 32.0)),
            _ => const RegisterStepperWidget(),
          },
        ),
      ],
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (_, state) async {
          switch (state.status) {
            case BlocStatus.closeLoading:
              Navigator.of(context).pop();
              break;
            case BlocStatus.postLoading:
              await PopupDialog.showLoading(context);
              break;
            case BlocStatus.postFailure:
              PopupDialog.showError(context, msg: state.errorMsg);
              break;
            case BlocStatus.postSuccess:
              Navigator.of(context).popAndPushNamed(RouteName.login);
              break;
            default:
              break;
          }
        },
        buildWhen: (_, curr) => curr.reloadPage,
        builder: (_, state) => switch (state.status) {
          BlocStatus.getLoading => const RegisterShimmerPage(),
          BlocStatus.getFailure => FailureComponent(
              message: state.errorMsg,
              onRetry: () =>
                  context.read<RegisterBloc>().add(RegisterOnGetLookups()),
            ),
          _ => PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                RegisterStep1BodyWidget(),
                RegisterStep2BodyWidget(),
              ],
            ),
        },
      ),
    );
  }
}
