part of '../../../fixed_income.exports.dart';

class BondsCubit extends Cubit<BondsState> {
  final FixedIncomeRepository _repository;
  BondsCubit()
      : _repository = FixedIncomeRepository.instance,
        super(const BondsState());

  void onFetchBonds() async {
    emit(const BondsState(status: BlocStatus.loading));
    await Future.delayed(AppConfig.longDelayDuration);

    final result = await _repository.fetchBonds();

    switch (result) {
      case SuccessResponse():
        emit(BondsState(
          status: BlocStatus.success,
          bonds: result.data,
        ));
        break;
      case FailureResponse():
        emit(BondsState(
          status: BlocStatus.failure,
          error: result.message,
        ));
        break;
    }
  }
}
