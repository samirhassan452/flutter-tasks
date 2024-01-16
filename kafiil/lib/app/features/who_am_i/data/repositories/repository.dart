part of '../../who_am_i.exports.dart';

final class WhoAmIRepository {
  /// rds: Remote Data Source
  final WhoAmIRDS _rds;

  static WhoAmIRepository? _instance;
  WhoAmIRepository._({WhoAmIRDS? rds}) : _rds = rds ?? WhoAmIRDS();
  factory WhoAmIRepository() => _instance ??= WhoAmIRepository._();

  Future<ResponseState> fetchDependencies() async {
    try {
      final data = await _rds.fetchDependencies();
      return SuccessResponse(data);
    } on APIErrorResponse catch (error) {
      return FailureResponse(error.message);
    }
  }

  Future<ResponseState> whoAmI() async {
    try {
      final data = await _rds.whoAmI();
      return SuccessResponse(data);
    } on APIErrorResponse catch (error) {
      return FailureResponse(error.message);
    }
  }
}
