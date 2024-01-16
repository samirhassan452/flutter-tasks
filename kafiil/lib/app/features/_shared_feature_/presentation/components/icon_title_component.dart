part of '../../shared_feature.exports.dart';

class IconTitleComponent extends StatelessWidget {
  /// It will be applied to both of title & icon until titleColor or iconColor provided
  final Color color;
  final String title;
  final TextStyle? titleStyle;
  final Color? titleColor;
  final String icon;
  final double iconSize;
  final Color? iconColor;
  final double gap;
  const IconTitleComponent({
    super.key,
    this.color = AppColor.grey600,
    required this.title,
    this.titleStyle,
    this.titleColor,
    required this.icon,
    this.iconSize = 14.0,
    this.iconColor,
    this.gap = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgWidget(icon, size: Size.square(iconSize), color: iconColor ?? color),
        Gap(gap),
        Flexible(
          child: Text(
            title,
            style: titleStyle ??
                AppStyle.regularFont
                    .copyWith(color: titleColor ?? color, fontSize: 11.0),
          ),
        ),
      ],
    );
  }
}
