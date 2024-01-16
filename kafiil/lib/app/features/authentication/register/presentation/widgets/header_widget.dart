part of '../../register.exports.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 0.0,
      pinned: true,
      title: Row(
        children: [
          if (Navigator.canPop(context)) ...[
            BackButton(
              color: AppColor.grey900,
              style: IconButton.styleFrom(
                highlightColor: Colors.transparent,
              ),
              onPressed: () {
                if (context.read<StepperCubit>().isFirstStep) {
                  Navigator.pop(context);
                } else {
                  context.read<StepperCubit>().onBack();
                }
              },
            ),
            const Gap(12.0),
          ],
          const Text("Register"),
        ],
      ),
    );
  }
}
