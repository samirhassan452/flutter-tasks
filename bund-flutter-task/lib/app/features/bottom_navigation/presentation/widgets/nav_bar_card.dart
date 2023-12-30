part of '../../bottom_navigation.exports.dart';

class BottomNavBarCard extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;
  const BottomNavBarCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgWidget(
              icon,
              size: const Size.square(24.0),
              color: color,
            ),
            //
            const Gap(3.0),
            //
            Text(
              label,
              style: AppStyle.bottomNavigation.copyWith(color: color),
            ),
            //
            AnimatedPadding(
              duration: AppConfig.animationDuration,
              padding: EdgeInsets.only(top: isSelected ? 3.0 : 0.0),
              child: AnimatedScale(
                duration: AppConfig.animationDuration,
                curve: Curves.easeInOut,
                scale: isSelected ? 1.0 : 0.0,
                child: CircleAvatar(backgroundColor: color, radius: 4.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color get color => isSelected ? AppColor.primary4 : AppColor.textQuaternary;
}
