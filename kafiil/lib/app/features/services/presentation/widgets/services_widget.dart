part of '../../services.exports.dart';

class DefaultServicesWidget extends StatelessWidget {
  final List<ServiceModel> services;
  const DefaultServicesWidget({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: GlowingScrollWidget(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => FadeInRight(
            from: index * 50,
            child: ServiceCard(service: services[index]),
          ),
          separatorBuilder: (_, __) => const Gap(8.0),
          itemCount: services.length,
        ),
      ),
    );
  }
}
