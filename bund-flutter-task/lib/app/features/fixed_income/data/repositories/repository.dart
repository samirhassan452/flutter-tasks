part of '../../fixed_income.exports.dart';

final class FixedIncomeRepository {
  /// rds: Remote Data Source
  final FixedIncomeLDS _rds;

  static FixedIncomeRepository? _instance;
  FixedIncomeRepository._() : _rds = FixedIncomeLDS.instance;
  static FixedIncomeRepository get instance =>
      _instance ??= FixedIncomeRepository._();

  Future<ResponseState> fetchBonds() async {
    try {
      final data = await _rds.fetchBonds();
      return SuccessResponse(data);
    } on ArgumentError catch (error) {
      return FailureResponse(error.message);
    }
  }

  Future<ResponseState> persistInvestmentAmount(double amount) async {
    try {
      final data = await _rds.persistInvestmentAmount(amount);
      return SuccessResponse(data);
    } on ArgumentError catch (error) {
      return FailureResponse(error.message);
    }
  }

  Future<ResponseState> persistYearTerm(int yearTerm) async {
    try {
      final data = await _rds.persistYearTerm(yearTerm);
      return SuccessResponse(data);
    } on ArgumentError catch (error) {
      return FailureResponse(error.message);
    }
  }

  Future<ResponseState> fetchInvestmentAmount() async {
    try {
      final data = await _rds.fetchInvestmentAmount();
      return SuccessResponse(data);
    } on ArgumentError catch (error) {
      return FailureResponse(error.message);
    }
  }

  Future<ResponseState> fetchYearTerm() async {
    try {
      final data = await _rds.fetchYearTerm();
      return SuccessResponse(data);
    } on ArgumentError catch (error) {
      return FailureResponse(error.message);
    }
  }
}
