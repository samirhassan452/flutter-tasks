part of '../../fixed_income.exports.dart';

class FixedIncomeFabButtons extends StatelessWidget {
  final VoidCallback onScrollToBottom;
  final VoidCallback onScrollToTop;
  const FixedIncomeFabButtons({
    super.key,
    required this.onScrollToBottom,
    required this.onScrollToTop,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollToCubit, bool>(
      builder: (_, scrollToTop) => AnimatedSwitcher(
        duration: AppConfig.animationDuration,
        child: switch (scrollToTop) {
          (_) when scrollToTop => ScrollToButton(
              onPressed: onScrollToTop,
              icon: Icons.arrow_upward_rounded,
            ),
          _ => ScrollToButton(
              onPressed: onScrollToBottom,
              icon: Icons.arrow_downward_rounded,
            ),
        },
      ),
    );
  }
}
