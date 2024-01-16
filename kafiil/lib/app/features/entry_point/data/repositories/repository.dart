part of '../../entry_point.exports.dart';

final class EntryPointRepository {
  /// rds: Remote Data Source
  final EntryPointLDS _rds;

  static EntryPointRepository? _instance;
  EntryPointRepository._({EntryPointLDS? rds}) : _rds = rds ?? EntryPointLDS();
  factory EntryPointRepository() => _instance ??= EntryPointRepository._();

  Future<ResponseState> fetchToken() async {
    try {
      final data = await _rds.fetchToken();
      return SuccessResponse(data);
    } on Exception catch (error) {
      return FailureResponse(error.toString());
    }
  }

  Future<ResponseState> persistToken(String token) async {
    try {
      await _rds.persistToken(token);
      return SuccessResponse(null);
    } on Exception catch (error) {
      return FailureResponse(error.toString());
    }
  }

  Future<ResponseState> clearToken() async {
    try {
      await _rds.clearToken();
      return SuccessResponse(null);
    } on Exception catch (error) {
      return FailureResponse(error.toString());
    }
  }

  Future<ResponseState> fetchAuth() async {
    try {
      final data = await _rds.fetchAuth();
      return SuccessResponse(data);
    } on Exception catch (error) {
      return FailureResponse(error.toString());
    }
  }

  Future<ResponseState> persistAuth(LoginModel login) async {
    try {
      await _rds.persistAuth(login);
      return SuccessResponse(null);
    } on Exception catch (error) {
      return FailureResponse(error.toString());
    }
  }

  Future<ResponseState> clearAuth() async {
    try {
      await _rds.clearAuth();
      return SuccessResponse(null);
    } on Exception catch (error) {
      return FailureResponse(error.toString());
    }
  }
}
