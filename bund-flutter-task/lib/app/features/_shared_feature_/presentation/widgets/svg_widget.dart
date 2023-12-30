part of '../../shared_feature.exports.dart';

class SvgWidget extends StatelessWidget {
  final String svg;
  final Size? size;
  final Color? color;
  final AlignmentGeometry alignment;
  final BoxFit fit;

  const SvgWidget(
    this.svg, {
    super.key,
    this.size,
    this.color,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    try {
      return SvgPicture.asset(
        svg,
        colorFilter: colorFilter,
        width: size?.width,
        height: size?.height,
        alignment: alignment,
        fit: fit,
      );
    } catch (e) {
      throw FlutterError("Cannot render, wrong SVG");
    }
  }

  ColorFilter? get colorFilter =>
      color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;
}
