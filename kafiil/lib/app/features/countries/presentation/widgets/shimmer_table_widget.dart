part of '../../countries.exports.dart';

class CountriesShimmerTableWidget extends StatelessWidget {
  final int numOfRows;
  const CountriesShimmerTableWidget({super.key, this.numOfRows = 10});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          for (int index = 0; index < numOfRows; index++) ...[
            if (index != 0) const Gap(8.0),
            const Row(
              children: [
                Expanded(child: ShimmerEffectWidget(height: 20.0)),
                Gap(4.0),
                Expanded(child: ShimmerEffectWidget(height: 20.0)),
              ],
            ),
            if (index != numOfRows - 1) const Gap(12.0),
            if (index != numOfRows - 1)
              const Divider(height: 1.0, color: AppColor.grey100),
          ],
        ],
      ),
    );
  }
}
