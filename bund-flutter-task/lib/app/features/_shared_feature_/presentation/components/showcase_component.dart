part of '../../shared_feature.exports.dart';

class ShowcaseComponent extends StatelessWidget {
  final GlobalKey _globalKey;
  final String description;
  final ShapeBorder? targetShapeBorder;
  final Widget child;
  const ShowcaseComponent({
    required GlobalKey key,
    required this.description,
    this.targetShapeBorder,
    required this.child,
  })  : _globalKey = key,
        super(key: null);

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: _globalKey,
      description: description,
      targetShapeBorder: targetShapeBorder ??
          CircleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 3,
            ),
          ),
      tooltipBackgroundColor: Theme.of(context).colorScheme.primary,
      textColor: AppColor.white,
      child: child,
    );
  }
}
