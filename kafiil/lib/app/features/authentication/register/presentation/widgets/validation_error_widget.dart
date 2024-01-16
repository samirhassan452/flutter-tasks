part of '../../register.exports.dart';

class RegisterValidationErrorWidget extends StatelessWidget {
  const RegisterValidationErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Flash(
        key: ValueKey(showValidationError(context)),
        delay: const Duration(milliseconds: 500),
        child: ValidationErrorComponent(show: showValidationError(context)),
      ),
    );
  }

  bool showValidationError(BuildContext context) =>
      (context.watch<RegisterStep1Bloc>().state.isValidationFailed &&
          isFirstStep(context)) ||
      (context.watch<RegisterStep2Bloc>().state.isValidationFailed &&
          isLastStep(context));

  bool isFirstStep(BuildContext context) =>
      context.watch<StepperCubit>().isFirstStep;
  bool isLastStep(BuildContext context) =>
      context.watch<StepperCubit>().isLastStep;
}
