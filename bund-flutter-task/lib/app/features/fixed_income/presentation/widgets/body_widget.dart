part of '../../fixed_income.exports.dart';

class FixedIncomeBodyWidget extends StatelessWidget {
  final ScrollController controller;
  const FixedIncomeBodyWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: () async => context.read<BondsCubit>().onFetchBonds(),
      showChildOpacityTransition: false,
      animSpeedFactor: 1.5,
      color: Theme.of(context).colorScheme.primary,
      child: GlowingScrollWidget(
        child: CustomScrollView(
          controller: controller,
          slivers: [
            const SliverGap(30.0),
            //! Portfolio
            SliverPadding(
              padding: padding,
              sliver: const SliverToBoxAdapter(
                child: FixedIncomePortfolioWidget(),
              ),
            ),
            const SliverGap(30.0),
            //! Annual Yield To Maturity (YTM)
            SliverPadding(
              padding: padding,
              sliver: const SliverToBoxAdapter(child: FixedIncomeYTMWidget()),
            ),
            const SliverGap(30.0),
            //! Investment Calculator
            SliverPadding(
              padding: padding,
              sliver: const SliverToBoxAdapter(
                child: FixedIncomeInvestmentCalculatorWidget(),
              ),
            ),
            const SliverGap(30.0),
            //! Bonds
            SliverPadding(
              padding: padding,
              sliver: const SliverToBoxAdapter(
                child: SectionTitleComponent(title: 'Bonds'),
              ),
            ),
            SliverPadding(
              padding: padding,
              sliver: BlocBuilder<BondsCubit, BondsState>(
                buildWhen: (_, curr) => curr.rebuildBonds,
                builder: (_, state) => switch (state.status) {
                  BlocStatus.success => SliverList.separated(
                      itemBuilder: (_, index) => FadeInDown(
                        from: index + 50,
                        child: BondCard(
                          logo: state.bonds[index].logo,
                          name: state.bonds[index].name,
                          description: state.bonds[index].degree,
                          link: state.bonds[index].website,
                          percentage: state.bonds[index].percentage,
                        ),
                      ),
                      separatorBuilder: (_, __) => const Gap(16),
                      itemCount: state.bonds.length,
                    ),
                  BlocStatus.failure => SliverToBoxAdapter(
                      child: FadeIn(
                        child: FailureComponent(
                          message: state.errorMessage,
                          onRetry: context.read<BondsCubit>().onFetchBonds,
                        ),
                      ),
                    ),
                  BlocStatus.loading => SliverList.separated(
                      itemBuilder: (_, index) => SlideInLeft(
                        from: index + 50,
                        child: const ShimmerEffectWidget(height: 70.0),
                      ),
                      itemCount: 5,
                      separatorBuilder: (_, __) => const Gap(16),
                    ),
                  _ => const SizedBox.shrink(),
                },
              ),
            ),
            const SliverGap(30.0),
            //! Button
            SliverPadding(
              padding: padding,
              sliver: const SliverToBoxAdapter(
                child: FixedIncomeButtonWidget(),
              ),
            ),
            const SliverGap(80.0),
          ],
        ),
      ),
    );
  }

  EdgeInsetsGeometry get padding =>
      const EdgeInsetsDirectional.symmetric(horizontal: 18.38);
}
