part of '../../shared_feature.exports.dart';

class BondCard extends StatelessWidget {
  final String logo;
  final String name;
  final String description;
  final String link;
  final double percentage;
  const BondCard({
    super.key,
    required this.logo,
    required this.name,
    required this.description,
    required this.link,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: borderRadius,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: AppColor.white,
          boxShadow: const [AppStyle.boxShadow],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    //? Logo
                    Container(
                      width: 48.0,
                      height: 48.0,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF8F8F8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(48.0),
                        child: Image.asset(logo, width: 40.0, height: 40.0),
                      ),
                    ),
                    const Gap(10.0),
                    //? Title & Subtitle
                    Expanded(
                      child: TitleSubtitleComponent(
                        titleText: name,
                        titleStyle: AppStyle.semiBoldFont.copyWith(
                          color: AppColor.black,
                          fontSize: 14.0,
                          height: 1.4,
                        ),
                        subtitleText: description,
                        subtitleStyle: AppStyle.regularFont.copyWith(
                          color: AppColor.textTertiary,
                          fontSize: 12.0,
                        ),
                        gap: 8.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10.0),
              Text(
                '$resolvedPercentage% APY',
                style: AppStyle.semiBoldFont.copyWith(
                  color: AppColor.green,
                  fontSize: 14.0,
                  height: 1.4, // This corresponds to line-height: 140%
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BorderRadius get borderRadius =>
      const BorderRadius.all(Radius.circular(10.0));

  EdgeInsetsGeometry get padding => const EdgeInsets.symmetric(horizontal: 16.0)
      .copyWith(bottom: 5.0, top: 3.0);

  // double get resolvedPercentage => double.parse(percentage.toStringAsFixed(2));
  double get resolvedPercentage => percentage.toPrecision(2);
}
