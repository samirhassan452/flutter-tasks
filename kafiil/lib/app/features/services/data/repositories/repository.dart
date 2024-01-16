part of '../../services.exports.dart';

final class ServicesRepository {
  /// rds: Remote Data Source
  final ServicesRDS _rds;

  static ServicesRepository? _instance;
  ServicesRepository._({ServicesRDS? rds}) : _rds = rds ?? ServicesRDS();
  factory ServicesRepository() => _instance ??= ServicesRepository._();

  Future<ResponseState> fetchServices() async {
    try {
      final data = await _rds.fetchServices();
      return SuccessResponse(data);
    } on APIErrorResponse catch (error) {
      return FailureResponse(error.message);
    }
  }

  Future<ResponseState> fetchPopularServices() async {
    try {
      final data = await _rds.fetchPopularServices();
      return SuccessResponse(data);
    } on APIErrorResponse catch (error) {
      return FailureResponse(error.message);
    }
  }
}
