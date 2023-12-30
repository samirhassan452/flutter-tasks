part of '../../shared_feature.exports.dart';

class ShimmerEffectWidget extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  const ShimmerEffectWidget({
    super.key,
    this.height = 100.0,
    this.width = double.maxFinite,
    this.borderRadius = 10.0,
    this.margin,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
