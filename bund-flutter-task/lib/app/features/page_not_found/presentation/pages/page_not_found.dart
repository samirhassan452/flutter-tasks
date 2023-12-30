part of '../../page_not_found.exports.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: AppStyle.boldFont.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 32.0,
              ),
            ),
            const Gap(20.0),
            Text(
              'Page Not Found',
              style: AppStyle.semiBoldFont.copyWith(
                color: AppColor.navyLight2,
                fontSize: 24.0,
              ),
            ),
            if (Navigator.of(context).canPop()) ...[
              const Gap(50.0),
              FloatingActionButton.extended(
                onPressed: Navigator.of(context).pop,
                label: const Text('Back'),
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
