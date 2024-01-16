part of '../../shared_feature.exports.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback? onTap;
  const ServiceCard({super.key, required this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      child: Material(
        color: AppColor.white,
        elevation: 2.0,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(3.0),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      _Image(image: service.mainImage),
                      _Price(price: service.price),
                    ],
                  ),
                ),
              ),
              const Gap(8.0),
              _Title(title: service.title),
              const Gap(8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _RatingAndSales(
                  rating: service.averageRating,
                  sales: service.completedSalesCount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BorderRadius get borderRadius => BorderRadius.circular(8.0);
}

class _Image extends StatelessWidget {
  const _Image({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage(IconPath.kafiilLogo),
      image: NetworkImage(image),
      height: 100.0,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class _Price extends StatelessWidget {
  const _Price({required this.price});

  final num price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        color: AppColor.primary900,
        borderRadius: BorderRadius.circular(27.0),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          child: Text(
            "\$$price",
            style: AppStyle.mediumFont.copyWith(
              color: AppColor.white,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: AppStyle.service,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _RatingAndSales extends StatelessWidget {
  const _RatingAndSales({
    required this.rating,
    required this.sales,
  });

  final double rating;
  final int sales;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: IconTitleComponent(
            icon: IconPath.star,
            title: "($rating)",
            color: AppColor.warning300,
          ),
        ),
        const Gap(6.0),
        SizedBox.fromSize(
          size: const Size(1.0, 10.0),
          child: const ColoredBox(color: AppColor.grey300),
        ),
        const Gap(6.0),
        Flexible(
          child: IconTitleComponent(
            icon: IconPath.basket,
            title: "$sales",
          ),
        ),
      ],
    );
  }
}
