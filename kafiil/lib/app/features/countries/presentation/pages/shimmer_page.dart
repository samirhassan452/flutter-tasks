part of '../../countries.exports.dart';

class CountriesShimmerPage extends StatelessWidget {
  const CountriesShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowingScrollWidget(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: const [
          Gap(32.0),
          ShimmerEffectWidget(height: 400.0),
          Gap(32.0),
          ShimmerEffectWidget(height: 50.0),
        ],
      ),
    );
  }
}
