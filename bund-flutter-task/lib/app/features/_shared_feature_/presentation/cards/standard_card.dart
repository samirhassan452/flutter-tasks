part of '../../shared_feature.exports.dart';

class StandardCard extends StatelessWidget {
  final bool enabled;
  final String icon;
  final String title;
  final VoidCallback? onTap;
  const StandardCard({
    super.key,
    this.enabled = true,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.white.withOpacity(opacity),
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgWidget(
                icon,
                size: const Size.square(28.0),
                color: AppColor.primary.withOpacity(opacity),
              ),
              const Gap(8.0),
              Text(
                title.toCapitalized(),
                textAlign: TextAlign.center,
                style: AppStyle.semiBoldFont.copyWith(
                  color: AppColor.primary3.withOpacity(opacity),
                  fontSize: 12.0,
                  height: 1.4, // This corresponds to line-height: 140%
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BorderRadius get borderRadius => const BorderRadius.all(Radius.circular(6.0));

  double get opacity => enabled ? 0.6 : 0.1;
}
