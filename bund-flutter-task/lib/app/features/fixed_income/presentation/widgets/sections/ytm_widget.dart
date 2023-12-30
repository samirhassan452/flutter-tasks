part of '../../../fixed_income.exports.dart';

class FixedIncomeYTMWidget extends StatelessWidget {
  const FixedIncomeYTMWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! YTM
        const _YTM(),

        if (context.watch<BondsCubit>().state.status.isSuccess ||
            context.watch<BondsCubit>().state.status.isLoading) ...[
          const Gap(5.0),
        ],
        //! Average Rating & Bonds
        BlocBuilder<BondsCubit, BondsState>(
          buildWhen: (_, curr) => curr.rebuildBonds,
          builder: (_, state) => AnimatedSwitcher(
            duration: AppConfig.animationDuration,
            child: switch (state.status) {
              BlocStatus.success => _AverageRatingAndBonds(
                  avgRating: 'AA',
                  length: state.bonds.length,
                ),
              BlocStatus.loading => const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: ShimmerEffectWidget(height: 80.0)),
                    Gap(10.0),
                    Expanded(child: ShimmerEffectWidget(height: 80.0)),
                  ],
                ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
        if (AppConfig.yearTerms.isNotEmpty) ...[
          const Gap(5.0),
          //! Term Types
          const _TermTypes(),
        ],
      ],
    );
  }
}

//! YTM
class _YTM extends StatelessWidget {
  const _YTM();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TitleSubtitleComponent(
        crossAxisAlignment: CrossAxisAlignment.center,
        title: Text.rich(
          const TextSpan(
            text: 'Annual Yield To Maturity (YTM) ',
            children: [
              WidgetSpan(
                child: Icon(Icons.info, color: AppColor.navyLight2, size: 16.0),
                alignment: PlaceholderAlignment.top,
              ),
            ],
          ),
          style: AppStyle.semiBoldFont
              .copyWith(color: AppColor.navyLight2, fontSize: 12.0),
          textAlign: TextAlign.center,
        ),
        subtitleText: '${AppConfig.annualYield}%',
        subtitleStyle: AppStyle.semiBoldFont.copyWith(
          color: AppColor.primary,
          fontSize: 31.0,
          height: 1.6129, // This corresponds to line-height: 50px,
        ),
      ),
    );
  }
}

//! Average Rating & Bonds
class _AverageRatingAndBonds extends StatelessWidget {
  final String avgRating;
  final int length;
  const _AverageRatingAndBonds({required this.avgRating, required this.length});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TitleSubtitleComponent(
            titleText: 'Average Rating',
            subtitleText: avgRating,
          ),
        ),
        Expanded(
          child: TitleSubtitleComponent(
            crossAxisAlignment: CrossAxisAlignment.end,
            titleText: 'Bonds',
            subtitleText: '$length Companies',
          ),
        ),
      ],
    );
  }
}

//! Term Types
class _TermTypes extends StatelessWidget {
  const _TermTypes();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Term Types',
          style: AppStyle.semiBoldFont
              .copyWith(fontSize: 12.0, color: AppColor.navyLight2),
        ),
        const Gap(10.0),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            for (int term in AppConfig.yearTerms) ...[
              TermTypeCard(numOfYearTerms: term),
            ],
          ],
        ),
      ],
    );
  }
}
