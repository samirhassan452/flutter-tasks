part of '../../register.exports.dart';

class RegisterFooterWidget extends StatelessWidget {
  const RegisterFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppConfig.animationDuration,
      child: switch (context.watch<RegisterBloc>().state.status) {
        BlocStatus.getLoading => const SizedBox.shrink(),
        _ => Container(
            height: 100.0,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
              left: 20.0,
              right: 20.0,
            ),
            child: switch (context.watch<StepperCubit>().isFirstStep) {
              (bool yes) when yes => FadeInLeft(child: const _Next()),
              _ => FadeInRight(
                  child: ElevatedButton(
                    onPressed: () => context
                        .read<RegisterStep2Bloc>()
                        .add(RegisterStep2OnSubmit()),
                    child: const Text("Submit"),
                  ),
                ),
            },
          ),
      },
    );
  }
}

//!
class _Next extends StatelessWidget {
  const _Next();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox.expand()),
        Expanded(
          child: ElevatedButton(
            onPressed: () =>
                context.read<RegisterStep1Bloc>().add(RegisterStep1OnNext()),
            child: const Text("Next"),
          ),
        ),
      ],
    );
  }
}
