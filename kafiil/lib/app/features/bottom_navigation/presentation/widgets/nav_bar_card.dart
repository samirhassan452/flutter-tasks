part of '../../bottom_navigation.exports.dart';

class BottomNavBarCard extends StatelessWidget {
  final BottomNavBar tab;
  final bool isSelected;
  final VoidCallback onSelected;
  const BottomNavBarCard({
    super.key,
    required this.tab,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: AnimatedContainer(
        duration: AppConfig.animationDuration,
        decoration: BoxDecoration(border: border, gradient: gradient),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgWidget(
              switch (isSelected) {
                (_) when isSelected => tab.activeIcon,
                _ => tab.icon,
              },
              size: const Size.square(26.0),
              color: color,
            ),
            //
            const Gap(6.0),
            //
            Text(
              tab.label,
              style: AppStyle.bottomNavigation.copyWith(
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: color,
              ),
            ),
            //
            /* AnimatedPadding(
              duration: AppConfig.animationDuration,
              padding: EdgeInsets.only(top: isSelected ? 3.0 : 0.0),
              child: AnimatedScale(
                duration: AppConfig.animationDuration,
                curve: Curves.easeInOut,
                scale: isSelected ? 1.0 : 0.0,
                child: CircleAvatar(backgroundColor: color, radius: 4.0),
              ),
            ), */
          ],
        ),
      ),
    );
  }

  LinearGradient get linearGradient => const LinearGradient(
        colors: [AppColor.primary100, Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  Gradient? get gradient => isSelected ? linearGradient : null;

  Border get borderSide =>
      const Border(top: BorderSide(width: 3.0, color: AppColor.primary900));
  Border? get border => isSelected ? borderSide : null;

  Color get color => isSelected ? AppColor.primary900 : AppColor.grey300;
}
