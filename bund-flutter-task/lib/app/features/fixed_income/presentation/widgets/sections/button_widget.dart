part of '../../../fixed_income.exports.dart';

class FixedIncomeButtonWidget extends StatelessWidget {
  const FixedIncomeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // onPressed: () => MotionToast(
      //   width: MediaQuery.of(context).size.width * 0.85,
      //   height: 100.0,
      //   icon: Icons.alarm_rounded,
      //   primaryColor: Colors.blue[600]!,
      //   backgroundType: BackgroundType.lighter,
      //   secondaryColor: Theme.of(context).colorScheme.primary,
      //   description: Text(
      //     'This feature is under development',
      //     style: AppStyle.semiBoldFont.copyWith(color: AppColor.primary),
      //   ),
      //   position: MotionToastPosition.top,
      //   animationType: AnimationType.fromTop,
      //   onClose: () {},
      // ).show(context),
      onPressed: () => InAppNotification.show(
        duration: const Duration(seconds: 2),
        onTap: context.closeNotification,
        child: NotificationCard.success(
          description: 'Account Created Successfully',
        ),
        context: context,
      ),
      child: Text(
        'Create Investment Account',
        style: AppStyle.elevatedButton,
      ),
    );
  }
}
