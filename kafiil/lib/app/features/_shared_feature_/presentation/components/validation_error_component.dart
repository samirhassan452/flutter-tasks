part of '../../shared_feature.exports.dart';

class ValidationErrorComponent extends StatelessWidget {
  final bool show;
  final String msg;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  const ValidationErrorComponent({
    super.key,
    required this.show,
    this.msg = "Fill the required fields",
    this.padding = const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
    this.margin =
        const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0, bottom: 0.0),
  });

  @override
  Widget build(BuildContext context) {
    return switch (show) {
      (_) when show => FadeIn(
          key: ValueKey("$show"),
          child: Container(
            padding: padding,
            margin: margin,
            decoration: const BoxDecoration(
              color: AppColor.error50,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Row(
              children: [
                const RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.error_outline,
                    color: AppColor.error300,
                    size: 20.0,
                  ),
                ),
                const Gap(8.0),
                Text(
                  "Fill the required fields",
                  style: AppStyle.mediumFont.copyWith(
                    color: AppColor.error300,
                    fontSize: 12.0,
                    height: 13.0 / 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
