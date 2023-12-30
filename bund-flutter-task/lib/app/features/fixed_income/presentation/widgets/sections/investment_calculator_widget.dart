part of '../../../fixed_income.exports.dart';

class FixedIncomeInvestmentCalculatorWidget extends StatelessWidget {
  const FixedIncomeInvestmentCalculatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionTitleComponent(
      title: 'Investment Calculator',
      child: BlocBuilder<InvestmentAmountCubit, InvestmentAmountState>(
        buildWhen: (_, curr) => curr.rebuildCalculator,
        builder: (_, state) => AnimatedSwitcher(
          duration: AppConfig.animationDuration,
          child: switch (state.status) {
            BlocStatus.loading => const ShimmerEffectWidget(height: 300.0),
            _ => Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [AppStyle.boxShadow],
                ),
                child: const Column(
                  children: [
                    //! Amount
                    FixedIncomeInvestmentAmountWidget(),
                    Gap(20.0),
                    //! Year Terms
                    FixedIncomeInvestmentYearTermsWidget(),
                    Gap(20.0),
                    //! Calculations
                    FixedIncomeInvestmentCalculationsWidget(),
                  ],
                ),
              ),
          },
        ),
      ),
    );
  }
}
