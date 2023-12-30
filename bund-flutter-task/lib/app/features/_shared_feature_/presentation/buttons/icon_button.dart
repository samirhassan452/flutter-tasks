part of '../../shared_feature.exports.dart';

class IconButtonWidget extends StatelessWidget {
  final Widget icon;
  final double elevation;
  final BorderSide side;
  final double size;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  const IconButtonWidget({
    super.key,
    required this.icon,
    this.elevation = 1.0,
    this.side = BorderSide.none,
    this.size = 40.0,
    this.color,
    this.padding = const EdgeInsets.all(8.0),
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Material(
        color: color,
        shadowColor: AppColor.iconButtonShadow,
        shape: CircleBorder(side: side),
        elevation: elevation,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          onDoubleTap: onDoubleTap,
          customBorder: CircleBorder(side: side),
          child: Container(
            padding: padding,
            alignment: Alignment.center,
            child: icon,
          ),
        ),
      ),
    );
    // return IconButton(
    //   onPressed: onPressed,
    //   color: color,
    //   alignment: Alignment.center,
    //   padding: padding,
    //   constraints: constraints,
    //   icon: icon,
    // );
  }
}
