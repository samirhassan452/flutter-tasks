part of '../../shared_feature.exports.dart';

//!
class ShimmerFieldComponent extends StatelessWidget {
  final double fieldHeight;
  const ShimmerFieldComponent({super.key, this.fieldHeight = 56.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: AlignmentDirectional.centerStart,
          child: ShimmerEffectWidget(height: 25.0, width: 100.0),
        ),
        const Gap(8.0),
        ShimmerEffectWidget(height: fieldHeight),
      ],
    );
  }
}
