part of '../../home.exports.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: () async => context.read<PackagesCubit>().onFetchPackages(),
      showChildOpacityTransition: false,
      animSpeedFactor: 1.5,
      color: Theme.of(context).colorScheme.primary,
      child: GlowingScrollWidget(
        child: CustomScrollView(
          slivers: [
            const SliverGap(16.0),
            //! Header
            const SliverToBoxAdapter(child: HomeBodySliderWidget()),

            const SliverGap(16.0),
            //! Conditions
            SliverPadding(
              padding: padding,
              sliver: const SliverToBoxAdapter(
                child: SectionTitleComponent(title: 'Conditions', gap: 16.0),
              ),
            ),
            SliverPadding(
              padding: padding,
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 16 / 9,
                ),
                itemCount: conditionsLength,
                itemBuilder: (_, index) => StandardCard(
                  icon: conditionsIcon[index],
                  title: conditionsTitle[index],
                  onTap: () {},
                ),
              ),
            ),
            const SliverGap(16.0),
            //! What you get
            SliverPadding(
              padding: padding,
              sliver: const SliverToBoxAdapter(
                child: SectionTitleComponent(title: 'What You Get', gap: 16.0),
              ),
            ),
            SliverPadding(
              padding: padding,
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 13.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: whatYouGetLength,
                itemBuilder: (_, index) => StandardCard(
                  enabled: index < whatYouGetLength - 2,
                  icon: whatYouGetIcon[index],
                  title: whatYouGetTitle[index],
                  onTap: () {},
                ),
              ),
            ),
            const SliverGap(16.0),
          ],
        ),
      ),
    );
  }

  EdgeInsetsGeometry get padding =>
      const EdgeInsets.symmetric(horizontal: 16.0);

  int get conditionsLength => conditionsIcon.length;
  List<String> get conditionsIcon => [IconPath.noDeposit, IconPath.bank];
  List<String> get conditionsTitle =>
      ['No Minimum Deposit', '\$15/Month (Paid Annually)'];

  int get whatYouGetLength => whatYouGetIcon.length;
  List<String> get whatYouGetIcon => [
        IconPath.bank,
        IconPath.masterCard,
        IconPath.flash,
        IconPath.umbrella,
        IconPath.seedling,
        IconPath.vault,
      ];
  List<String> get whatYouGetTitle => [
        'Swiss Bank Account',
        'Mastercard Prepaid',
        'Account Open Same Day',
        'Protected up to \$100,000',
        'Investments Portfolios',
        'Deposits Options',
      ];
}
