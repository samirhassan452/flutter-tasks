part of '../../register.exports.dart';

class RegisterStepperWidget extends StatelessWidget {
  const RegisterStepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<StepperCubit, int>(
          builder: (_, currentStep) {
            // currentStep++;
            final numOfSteps = RegisterSteps.values.length;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int index = 0; index < numOfSteps; index++) ...[
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _StepTitle(
                          title: RegisterSteps.values[index].label,
                          currentStep: currentStep,
                          index: index,
                        ),
                        const Gap(12.0),
                        Row(
                          children: [
                            Flexible(
                              child: _LinearIndicator(
                                color: switch (index) {
                                  (_) when currentStep >= index =>
                                    AppColor.primary900,
                                  _ => AppColor.grey200,
                                },
                              ),
                            ),
                            _StepWidget(
                              index: index,
                              currentStep: currentStep,
                            ),
                            Flexible(
                              child: _LinearIndicator(
                                color: switch (index) {
                                  (_) when currentStep > index =>
                                    AppColor.primary900,
                                  _ => AppColor.grey200,
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
    /* return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
      sliver: SliverToBoxAdapter(
        child: LayoutBuilder(
          builder: (_, cons) => BlocBuilder<StepperCubit, int>(
            builder: (_, currentStep) {
              currentStep++;
              final numOfSteps = RegisterSteps.values.length;
              return Stack(
                alignment: const AlignmentDirectional(-1.0, 0.55),
                // alignment: AlignmentDirectional(0.0, 0.55),
                clipBehavior: Clip.none,
                children: [
                  LinearProgressIndicator(
                    value: currentStep / (numOfSteps + 1),
                    backgroundColor: AppColor.grey200,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColor.primary900,
                    ),
                  ),
                  for (int index = 1; index <= numOfSteps; index++) ...[
                    Transform.translate(
                      offset: Offset(
                        index * (cons.maxWidth / (numOfSteps + 1)) -
                            (25.0 * index),
                        0.0,
                      ),
                      // 25.0: size of the circle
                      // start: index * (cons.maxWidth / (numOfSteps + 1)) - 25.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _StepTitle(
                            title: RegisterSteps.values[index - 1].label,
                            currentStep: currentStep,
                            index: index,
                          ),
                          const Gap(12.0),
                          _StepWidget(index: index, currentStep: currentStep),
                        ],
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    ); */
  }

  // int get numOfSteps => steps.length;
  // int get currentStep => 2;

  // List<String> get steps => ["Register", "Complete Data"];
}

//!
class _LinearIndicator extends StatelessWidget {
  final Color color;
  const _LinearIndicator({required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // margin: EdgeInsets.only(bottom: 10.0),
      // key: ValueKey<String>("$index"),
      duration: AppConfig.animationDuration,
      curve: Curves.easeIn,
      height: 3.0,
      color: color,
    );
  }
}

//!
class _StepTitle extends StatelessWidget {
  final String title;
  final int currentStep;
  final int index;
  const _StepTitle({
    required this.title,
    required this.currentStep,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: AppConfig.animationDuration,
      style: AppStyle.mediumFont.copyWith(
        fontWeight: index <= currentStep ? FontWeight.w600 : FontWeight.w500,
        color: index <= currentStep ? AppColor.primary900 : AppColor.grey300,
        fontSize: 12.0,
        height: 13.0 / 12.0,
      ),
      child: Text(title),
    );
  }
}

//!
class _StepWidget extends StatelessWidget {
  final int currentStep;
  final int index;
  const _StepWidget({
    required this.currentStep,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:
          currentStep == index ? AppConfig.animationDuration : Duration.zero,
      height: 25.0,
      width: 25.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: switch (index) {
          (_) when currentStep > index => AppColor.primary900,
          (_) when currentStep == index => AppColor.white,
          _ => AppColor.grey200,
        },
        border: switch (index) {
          (_) when currentStep == index =>
            Border.all(color: AppColor.primary900, width: 1.5),
          _ => null,
        },
      ),
      child: switch (index) {
        (_) when currentStep > index => const Icon(
            Icons.check,
            color: AppColor.white,
            size: 16.0,
          ),
        _ => AnimatedSwitcher(
            duration: AppConfig.animationDuration,
            child: switch (currentStep == index) {
              (bool showText) when showText => Text(
                  "${currentStep + 1}",
                  style: AppStyle.semiBoldFont.copyWith(
                    color: currentStep == index
                        ? AppColor.primary900
                        : Colors.transparent,
                    fontSize: 12.0,
                    // height: 13.0 / 12.0,
                  ),
                ),
              _ => const SizedBox.shrink(),
            },
          ),
      },
    );
  }
}
