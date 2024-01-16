part of '../../who_am_i.exports.dart';

class WhoAmIShimmerPage extends StatelessWidget {
  const WhoAmIShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowingScrollWidget(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
        children: const [
          Align(
            alignment: Alignment.center,
            child: ShimmerEffectWidget(
              width: 85.0,
              height: 85.0,
              borderRadius: 85.0 / 2,
            ),
          ),
          Gap(32.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: ShimmerFieldComponent()),
              Gap(10.0),
              Expanded(child: ShimmerFieldComponent()),
            ],
          ),
          Gap(16.0),
          ShimmerFieldComponent(),
          Gap(16.0),
          ShimmerFieldComponent(),
          Gap(16.0),
          ShimmerFieldComponent(fieldHeight: 40.0),
          Gap(16.0),
          ShimmerFieldComponent(fieldHeight: 115.0),
          Gap(16.0),
          ShimmerFieldComponent(),
          Gap(16.0),
          ShimmerFieldComponent(),
          Gap(16.0),
          ShimmerFieldComponent(fieldHeight: 40.0),
          Gap(16.0),
          ShimmerFieldComponent(fieldHeight: 115.0),
          Gap(16.0),
          ShimmerFieldComponent(fieldHeight: 115.0),
          Gap(16.0),
        ],
      ),
    );
  }
}
