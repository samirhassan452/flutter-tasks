part of '../../shared_feature.exports.dart';

class HSSCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String logo;
  final String type;
  final VoidCallback? onPreview;
  final VoidCallback? onStart;
  const HSSCard({
    super.key,
    required this.margin,
    required this.logo,
    required this.type,
    this.onPreview,
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      elevation: 0.0,
      margin: margin,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onPreview,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'bünd\n',
                        style: AppStyle.boldFont.copyWith(fontSize: 23.0),
                        children: [
                          TextSpan(
                            text: type,
                            style: AppStyle.regularFont.copyWith(
                              fontSize: 23.0,
                              color: AppColor.textQuaternary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(18.0),
                    IntrinsicWidth(child: _StartNow(onTap: onStart)),
                  ],
                ),
              ),
              Flexible(child: Image.asset(logo)),
            ],
          ),
        ),
      ),
    );
  }

  BorderRadius get borderRadius => const BorderRadius.all(Radius.circular(6.0));
}

class _StartNow extends StatelessWidget {
  const _StartNow({required this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        minimumSize: const Size.fromHeight(34.0),
        elevation: 0.0,
        backgroundColor: AppColor.primary.withOpacity(0.05),
        disabledBackgroundColor: AppColor.primary.withOpacity(0.05),
        foregroundColor: AppColor.iconButtonBackground,
      ),
      onPressed: onTap,
      label: Text(
        'Start Now',
        style: AppStyle.mediumFont.copyWith(
          color: AppColor.primary,
          fontSize: 13.0,
          height: 1.4,
        ),
      ),
      icon: const SvgWidget(
        IconPath.forwardBackwardArrow,
        size: Size.square(16.0),
      ),
    );
  }
}
