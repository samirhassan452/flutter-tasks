part of '../../shared_feature.exports.dart';

class SectionTitleComponent extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final double gap;
  final Widget? child;
  const SectionTitleComponent({
    super.key,
    required this.title,
    this.titleStyle,
    this.gap = 15.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ??
              AppStyle.semiBoldFont.copyWith(
                color: AppColor.primary,
                height: 1.25, // This corresponds to line-height: 20px
              ),
        ),
        Gap(gap),
        child ?? const SizedBox.shrink(),
      ],
    );
  }
}
