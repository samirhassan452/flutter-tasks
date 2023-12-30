part of '../../shared_feature.exports.dart';

class TermTypeCard extends StatelessWidget {
  final bool selected;
  final int numOfYearTerms;
  final VoidCallback? onTap;
  const TermTypeCard({
    super.key,
    this.selected = false,
    required this.numOfYearTerms,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: borderRadius,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          child: Text(
            '$numOfYearTerms Year Term',
            textAlign: TextAlign.center,
            style: AppStyle.semiBoldFont.copyWith(
              color: textColor,
              fontSize: 13.0,
              height: 1.53846, // This corresponds to line-height: 20px,
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius get borderRadius => const BorderRadius.all(Radius.circular(4.0));

  Color get backgroundColor =>
      selected ? AppColor.cardSelectedBackground : AppColor.white;
  Color get borderColor =>
      selected ? AppColor.primary : AppColor.primary.withOpacity(0.1);
  Color get textColor => selected ? AppColor.primary : AppColor.navyLight2;
}
