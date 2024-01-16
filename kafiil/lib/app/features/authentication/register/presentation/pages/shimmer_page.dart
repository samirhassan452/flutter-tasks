part of '../../register.exports.dart';

class RegisterShimmerPage extends StatelessWidget {
  const RegisterShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
      child: Column(
        children: [
          Gap(32.0),
          ShimmerEffectWidget(height: 30.0),
          Gap(42.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: ShimmerFieldComponent()),
              Gap(10.0),
              Expanded(child: ShimmerFieldComponent()),
            ],
          ),
          Gap(16.0),
          ShimmerFieldComponent(),
          Gap(16.0),
          ShimmerFieldComponent(),
          Gap(16.0),
          ShimmerFieldComponent(),
          Gap(16.0),
          ShimmerFieldComponent(),
        ],
      ),
    );
  }
}
