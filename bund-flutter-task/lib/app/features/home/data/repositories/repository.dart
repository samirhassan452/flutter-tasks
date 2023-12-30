part of '../../home.exports.dart';

final class HomeRepository {
  /// rds: Remote Data Source
  final HomeLDS _rds;

  static HomeRepository? _instance;
  HomeRepository._() : _rds = HomeLDS.instance;
  static HomeRepository get instance => _instance ??= HomeRepository._();

  Future<ResponseState> fetchPackages() async {
    try {
      final data = await _rds.fetchPackages();
      return SuccessResponse(data);
    } on ArgumentError catch (error) {
      return FailureResponse(error.message);
    }
  }
}
