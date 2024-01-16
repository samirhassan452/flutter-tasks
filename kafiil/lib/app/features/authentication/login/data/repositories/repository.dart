part of '../../login.exports.dart';

final class LoginRepository {
  /// rds: Remote Data Source
  final LoginRDS _rds;

  static LoginRepository? _instance;
  LoginRepository._({LoginRDS? rds}) : _rds = rds ?? LoginRDS();
  factory LoginRepository() => _instance ??= LoginRepository._();

  Future<ResponseState> login(LoginModel model) async {
    try {
      final data = await _rds.login(model);
      return SuccessResponse(data);
    } on APIErrorResponse catch (error) {
      return FailureResponse(error.message);
    }
  }
}
