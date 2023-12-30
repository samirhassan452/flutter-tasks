part of '../../../fixed_income.exports.dart';

class InvestmentAmountCubit extends Cubit<InvestmentAmountState> {
  final FixedIncomeRepository _repository;
  InvestmentAmountCubit({Calculator? calculator})
      : _repository = FixedIncomeRepository.instance,
        super(
          InvestmentAmountState(
            calculator: calculator ?? Calculator.initial(),
            amount: AppConfig.initialAmount,
          ),
        );

  void onFetch() async {
    // emit(state.copyWith(isLoading: true));
    emit(state.copyWith(status: BlocStatus.loading));
    await Future.delayed(AppConfig.shortDelayDuration);

    final responses = await Future.wait([
      _repository.fetchInvestmentAmount(),
      _repository.fetchYearTerm(),
    ]);

    emit(state.copyWith(
      // isLoading: false,
      status: BlocStatus.success,
      amount: _onRefactorResponse<double>(responses[0]),
      calculator: state.calculator
          .copyWith(term: _onRefactorResponse<int>(responses[1])),
    ));
  }

  void onIncrement() {
    final amount = state.calculator.increment(state.amount);
    _waitBeforeAmountCallback(() async {
      await _repository.persistInvestmentAmount(amount);
      emit(state.copyWith(amount: amount));
    });
    // _waitSomeTimeBeforeEmit(state.copyWith(amount: amount));
  }

  void onDecrement() {
    final amount = state.calculator.decrement(state.amount);
    _waitBeforeAmountCallback(() async {
      await _repository.persistInvestmentAmount(amount);
      emit(state.copyWith(amount: amount));
    });
  }

  void onExponentialIncrement() {
    final amount = state.calculator.exponentialIncrement(state.amount);
    _waitBeforeAmountCallback(() async {
      await _repository.persistInvestmentAmount(amount);
      emit(state.copyWith(amount: amount));
    });
  }

  void onExponentialDecrement() {
    final amount = state.calculator.exponentialDecrement(state.amount);
    _waitBeforeAmountCallback(() async {
      await _repository.persistInvestmentAmount(amount);
      emit(state.copyWith(amount: amount));
    });
  }

  void onChangeYearTerm(int term) {
    _waitBeforeYearTermCallback(() async {
      await _repository.persistYearTerm(term);
      emit(state.copyWith(calculator: state.calculator.copyWith(term: term)));
    });
  }

  // void _waitSomeTimeBeforeEmit(InvestmentAmountState comingState) async {
  //   emit(state.copyWith(isLoading: true));
  //   await Future.delayed(AppConfig.shortDelayDuration);
  //   emit(comingState.copyWith(isLoading: false));
  // }

  void _waitBeforeAmountCallback(FutureOr<void> Function() callback) async {
    emit(state.copyWith(amountStatus: BlocStatus.loading));
    await Future.delayed(AppConfig.shortDelayDuration);
    callback();
    emit(state.copyWith(amountStatus: BlocStatus.success));
  }

  void _waitBeforeYearTermCallback(FutureOr<void> Function() callback) async {
    emit(state.copyWith(yearTermStatus: BlocStatus.loading));
    await Future.delayed(AppConfig.shortDelayDuration);
    callback();
    emit(state.copyWith(yearTermStatus: BlocStatus.success));
  }

  T? _onRefactorResponse<T>(ResponseState response) {
    switch (response) {
      case SuccessResponse():
        return response.data;
      case FailureResponse():
        return null;
    }
  }
}
