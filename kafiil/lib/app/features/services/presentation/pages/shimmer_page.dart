part of '../../services.exports.dart';

class DefaultServicesShimmerWidget extends StatelessWidget {
  const DefaultServicesShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: GlowingScrollWidget(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (_, __) => const Gap(8.0),
          itemBuilder: (_, __) => const ShimmerEffectWidget(width: 160.0),
        ),
      ),
    );
  }
}

class PopularServicesShimmerWidget extends StatelessWidget {
  const PopularServicesShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerEffectWidget(width: 160.0, height: 30.0),
        Gap(32.0),
        DefaultServicesShimmerWidget(),
      ],
    );
  }
}
