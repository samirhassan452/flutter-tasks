part of '../../../fixed_income.exports.dart';

class FixedIncomePortfolioWidget extends StatelessWidget {
  const FixedIncomePortfolioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fixed Income Portfolio',
          style: AppStyle.boldFont
              .copyWith(fontSize: 22, color: AppColor.primary3),
        ),
        const Gap(5),
        Text(
          'A fixed income portfolio consists of bonds and other securities providing steady income and relatively lower risk.',
          style: AppStyle.semiBoldFont.copyWith(
            color: AppColor.textSecondary,
            fontSize: 14.0,
            height: 1.71429, // This corresponds to line-height: 24px
          ),
        ),
      ],
    );
  }
}
