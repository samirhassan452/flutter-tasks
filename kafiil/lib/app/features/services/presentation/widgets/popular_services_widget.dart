part of '../../services.exports.dart';

class PopularServicesWidget extends StatelessWidget {
  final List<ServiceModel> popularServices;
  const PopularServicesWidget({super.key, required this.popularServices});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Pulse(
            delay: Duration(milliseconds: popularServices.length * 50),
            child: const Text('Popular Services', style: AppStyle.appBar),
          ),
        ),
        const Gap(32.0),
        DefaultServicesWidget(services: popularServices),
      ],
    );
  }
}
