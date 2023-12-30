part of '../../../../fixed_income.exports.dart';

class FixedIncomeInvestmentYearTermsWidget extends StatelessWidget {
  const FixedIncomeInvestmentYearTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvestmentAmountCubit, InvestmentAmountState>(
      buildWhen: (prev, curr) =>
          prev.yearTerm != curr.yearTerm || curr.rebuildYearTerm,
      builder: (_, state) => Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: [
          for (int term in AppConfig.yearTerms) ...[
            AnimatedSwitcher(
              duration: AppConfig.animationDuration,
              child: switch (state.yearTermStatus) {
                BlocStatus.loading =>
                  const ShimmerEffectWidget(height: 40.0, width: 110.0),
                _ => ElasticIn(
                    key: ValueKey(term),
                    child: AnimatedScale(
                      scale: term == state.yearTerm ? 1.0 : 0.95,
                      duration: AppConfig.shortDelayDuration,
                      child: TermTypeCard(
                        selected: term == state.yearTerm,
                        numOfYearTerms: term,
                        onTap: () => context
                            .read<InvestmentAmountCubit>()
                            .onChangeYearTerm(term),
                      ),
                    ),
                  ),
              },
            ),
          ],
        ],
      ),
    );
  }
}
