part of '../../../../fixed_income.exports.dart';

class FixedIncomeInvestmentAmountWidget extends StatelessWidget {
  const FixedIncomeInvestmentAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Title
        Text(
          'Investment Amount',
          textAlign: TextAlign.center,
          style: AppStyle.semiBoldFont
              .copyWith(color: AppColor.navyLight2, fontSize: 12.0),
        ),
        const Gap(10.0),
        //! Counter
        const _Counter(),
        const Gap(10.0),
        //! YTM
        Material(
          color: AppColor.green.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: BlocBuilder<InvestmentAmountCubit, InvestmentAmountState>(
              buildWhen: (prev, curr) =>
                  prev.calculator.annualYield != curr.calculator.annualYield,
              builder: (_, state) => Text(
                '${state.calculator.annualYield}% YTM',
                textAlign: TextAlign.center,
                style: AppStyle.semiBoldFont.copyWith(
                  color: AppColor.green,
                  fontSize: 13.0,
                  height: 1.53846, // This corresponds to line-height: 20px
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//! Counter
class _Counter extends StatelessWidget {
  const _Counter();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! Decrement
        // IconButton(
        //   onPressed: () {},
        //   icon: const SvgWidget(IconPath.minus),
        // ),
        IconButtonWidget(
          elevation: 4.0,
          color: AppColor.iconButtonBackground,
          onTap: () => onDecrement(context),
          onLongPress: () => onExponentialDecrement(context),
          icon: const SvgWidget(IconPath.minus),
        ),
        //! Value
        BlocBuilder<InvestmentAmountCubit, InvestmentAmountState>(
          buildWhen: (prev, curr) =>
              prev.amount != curr.amount || curr.rebuildAmount,
          builder: (_, state) => Expanded(
            child: AnimatedSwitcher(
              duration: AppConfig.animationDuration,
              child: switch (state.amountStatus) {
                BlocStatus.loading =>
                  const ShimmerEffectWidget(width: 150.0, height: 55.0),
                _ => Pulse(
                    key: ValueKey(state.amount),
                    child: Text(
                      state.amount.toFormatPrice(),
                      textAlign: TextAlign.center,
                      style: AppStyle.semiBoldFont.copyWith(
                        color: AppColor.primary,
                        fontSize: 36.0,
                        height:
                            1.66667, // This corresponds to line-height: 60px
                      ),
                    ),
                  ),
              },
            ),
          ),
        ),
        //! Increment
        IconButtonWidget(
          elevation: 4.0,
          color: AppColor.iconButtonBackground,
          onTap: context.read<InvestmentAmountCubit>().onIncrement,
          onLongPress: () => onExponentialIncrement(context),
          icon: const SvgWidget(IconPath.plus),
        ),
      ],
    );
  }

  void onDecrement(BuildContext context) async {
    final bool stopExecution = onCheckThreshold(context);
    if (stopExecution) return;
    context.read<InvestmentAmountCubit>().onDecrement();
  }

  void onExponentialDecrement(BuildContext context) async {
    await TextToSpeechService().speak('Exponential Decrement will be invoked');
    if (context.mounted) {
      final bool stopExecution = onCheckThreshold(context);
      if (stopExecution) return;
      onHapticFeedback();
      context.read<InvestmentAmountCubit>().onExponentialDecrement();
    }
  }

  void onExponentialIncrement(BuildContext context) async {
    await TextToSpeechService().speak('Exponential Increment will be invoked');
    if (context.mounted) {
      onHapticFeedback();
      context.read<InvestmentAmountCubit>().onExponentialIncrement();
    }
  }

  void onHapticFeedback() async {
    await HapticFeedback.heavyImpact();
    await SystemSound.play(SystemSoundType.click);
  }

  bool onCheckThreshold(BuildContext context) {
    final double amount = context.read<InvestmentAmountCubit>().state.amount;
    if (amount <= AppConfig.threshold) {
      InAppNotification.show(
        duration: const Duration(seconds: 2),
        onTap: context.closeNotification,
        child: NotificationCard.error(
          description:
              'You cannot decrease amount more than ${AppConfig.threshold.toFormatPrice()}',
        ),
        context: context,
      );
      return true;
    }
    return false;
  }
}
