part of '../../countries.exports.dart';

class CountriesBodyWidget extends StatelessWidget {
  const CountriesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowingScrollWidget(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const Gap(32.0),
          Flash(
            delay: const Duration(milliseconds: 1000),
            child: const CountriesTableWidget(),
          ),
          const Gap(32.0),
          SlideInLeft(
            child: ShakeX(
              delay: const Duration(milliseconds: 1000),
              child: const CountriesPageIndicatorsWidget(),
            ),
          ),
          const Gap(24.0),
        ],
      ),
    );
  }
}
