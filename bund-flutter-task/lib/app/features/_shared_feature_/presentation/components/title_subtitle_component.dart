part of '../../shared_feature.exports.dart';

class TitleSubtitleComponent extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget? title;
  final String? titleText;
  final TextStyle? titleStyle;
  final Widget? subtitle;
  final String? subtitleText;
  final TextStyle? subtitleStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final double gap;
  const TitleSubtitleComponent({
    super.key,
    this.padding = EdgeInsets.zero,
    this.title,
    this.titleText,
    this.titleStyle,
    this.subtitle,
    this.subtitleText,
    this.subtitleStyle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.gap = 0.0,
  })  : assert(
          !(title != null && titleText != null),
          'Declaring both title and titleText is not supported.',
        ),
        assert(
          !(subtitle != null && subtitleText != null),
          'Declaring both subtitle and subtitleText is not supported.',
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          switch (title) {
            (_) when title != null => title!,
            (_) when titleText != null => Text(
                titleText!,
                style: titleStyle ??
                    AppStyle.semiBoldFont
                        .copyWith(color: AppColor.navyLight2, fontSize: 12.0),
              ),
            _ => const SizedBox(),
          },
          Gap(gap),
          switch (title) {
            (_) when subtitle != null => subtitle!,
            (_) when subtitleText != null => Text(
                subtitleText!,
                style: subtitleStyle ??
                    AppStyle.semiBoldFont.copyWith(
                      color: AppColor.primary,
                      fontSize: 22.0,
                      height: 1.81818, // This corresponds to line-height: 40px
                    ),
              ),
            _ => const SizedBox(),
          },
        ],
      ),
    );
  }
}
