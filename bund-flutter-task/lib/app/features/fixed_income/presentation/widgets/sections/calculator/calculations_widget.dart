part of '../../../../fixed_income.exports.dart';

class FixedIncomeInvestmentCalculationsWidget extends StatelessWidget {
  const FixedIncomeInvestmentCalculationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvestmentAmountCubit, InvestmentAmountState>(
      buildWhen: (prev, curr) =>
          prev.yearTerm != curr.yearTerm ||
          curr.rebuildAmount ||
          curr.rebuildYearTerm,
      builder: (_, state) {
        final bool isLoading =
            state.amountStatus.isLoading || state.yearTermStatus.isLoading;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleSubtitleComponent(
                  titleText: 'Capital At Maturity',
                  subtitle: _LoadingWidget(
                    isLoading: isLoading,
                    child: BounceInLeft(
                      key: ValueKey(state.capitalAtMaturity),
                      child: Text(
                        state.capitalAtMaturity.toFormatPrice(),
                        style: subtitleStyle,
                      ),
                    ),
                  ),
                  // subtitleText: state.capitalAtMaturity.toFormatPrice(),
                ),
                TitleSubtitleComponent(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  titleText: 'Total Interest',
                  subtitle: _LoadingWidget(
                    isLoading: isLoading,
                    child: BounceInRight(
                      key: ValueKey(state.totalInterest),
                      child: Text(
                        state.totalInterest.toFormatPrice(),
                        style: subtitleStyle,
                      ),
                    ),
                  ),
                  // subtitleText: state.totalInterest.toFormatPrice(),
                ),
              ],
            ),
            const Gap(5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleSubtitleComponent(
                  titleText: 'Annual Interest',
                  subtitle: _LoadingWidget(
                    isLoading: isLoading,
                    child: BounceInLeft(
                      key: ValueKey(state.annualInterest),
                      child: Text(
                        state.annualInterest.toFormatPrice(),
                        style: subtitleStyle,
                      ),
                    ),
                  ),
                  // subtitleText: state.annualInterest.toFormatPrice(),
                ),
                TitleSubtitleComponent(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  titleText: 'Average Maturity Date',
                  subtitle: _LoadingWidget(
                    isLoading: isLoading,
                    child: BounceInRight(
                      key: ValueKey(state.averageMaturityDate),
                      child: Text(
                        state.averageMaturityDate,
                        style: subtitleStyle,
                      ),
                    ),
                  ),
                  // subtitleText: state.averageMaturityDate,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  TextStyle get subtitleStyle => AppStyle.semiBoldFont.copyWith(
        color: AppColor.primary,
        fontSize: 22.0,
        height: 1.81818, // This corresponds to line-height: 40px
      );
}

//!
class _LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const _LoadingWidget({required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return switch (isLoading) {
      (bool yes) when yes =>
        const ShimmerEffectWidget(width: 100.0, height: 55.0),
      _ => child,
    };
  }
}
