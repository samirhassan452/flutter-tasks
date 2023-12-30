part of '../../shared_feature.exports.dart';

class ScrollToButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const ScrollToButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: AppColor.white,
        size: 27.0,
      ),
    );
  }
}
