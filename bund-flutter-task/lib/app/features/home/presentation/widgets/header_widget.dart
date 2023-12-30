part of '../../home.exports.dart';

class HomeHeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey profileKey;
  final GlobalKey notificationKey;
  const HomeHeaderWidget({
    super.key,
    required this.profileKey,
    required this.notificationKey,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 16.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! Profile
          Expanded(
            child: Row(
              children: [
                ShowcaseComponent(
                  key: profileKey,
                  description: 'You can view or edit your profile here',
                  child: IconButtonWidget(
                    onTap: () => context.startShowCase(profileKey),
                    color: AppColor.white,
                    icon: const SvgWidget(IconPath.user),
                  ),
                ),
                const Gap(12.0),
                const Expanded(child: _WelcomeWithName()),
              ],
            ),
          ),
          const Gap(10.0),
          //! Notification
          ShowcaseComponent(
            key: notificationKey,
            description: 'You can view all notifications here',
            child: IconButtonWidget(
              onTap: () => context.startShowCase(notificationKey),
              color: AppColor.white,
              icon: const SvgWidget(IconPath.notification),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  // GlobalKey get profileKey => GlobalKey();
}

//! Welcome with Name
class _WelcomeWithName extends StatelessWidget {
  const _WelcomeWithName();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          switch (currentTime) {
            (_) when currentTime.hour < 12 => 'Good Morning,',
            (_) when currentTime.hour < 17 => 'Good Afternoon,',
            _ => 'Good Evening,',
          },
          style: AppStyle.regularFont.copyWith(
            fontSize: 10.0,
            color: AppColor.textSecondary,
          ),
        ),
        const Gap(2.0),
        Text(
          'Samir Hassan',
          style: AppStyle.semiBoldFont.copyWith(
            fontSize: 14.0,
            color: AppColor.primary2,
          ),
        ),
      ],
    );
  }

  TimeOfDay get currentTime => TimeOfDay.now();
}
