part of '../../bottom_navigation.exports.dart';

class BottomNavBarStructure extends StatelessWidget {
  final double height;
  final List<Widget> children;
  const BottomNavBarStructure({
    super.key,
    this.height = 75.0,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Material(
        elevation: 10.0,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        color: Colors.white,
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [...children],
          ),
        ),
      ),
    );
  }
}
