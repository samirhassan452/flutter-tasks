part of '../../register.exports.dart';

final class RegisterRepository {
  /// rds: Remote Data Source
  final RegisterRDS _rds;

  static RegisterRepository? _instance;
  RegisterRepository._({RegisterRDS? rds}) : _rds = rds ?? RegisterRDS();
  factory RegisterRepository() => _instance ??= RegisterRepository._();

  Future<ResponseState> fetchDependencies() async {
    try {
      final data = await _rds.fetchDependencies();
      return SuccessResponse(data);
    } on APIErrorResponse catch (error) {
      return FailureResponse(error.message);
    }
  }

  Future<ResponseState> register(RegisterModel user) async {
    try {
      final data = await _rds.register(user);
      return SuccessResponse(data);
    } on APIErrorResponse catch (error) {
      return FailureResponse(error.message);
    }
  }
}
