part of '../../shared_feature.exports.dart';

class FailureComponent extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  const FailureComponent({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: AppStyle.semiBoldFont.copyWith(
            color: Theme.of(context).colorScheme.error,
            fontSize: 24.0,
          ),
        ),
        const Gap(24.0),
        FloatingActionButton.extended(
          onPressed: onRetry,
          label: const Text('Retry'),
          icon: const Icon(Icons.refresh_rounded),
        ),
      ],
    );
  }
}
