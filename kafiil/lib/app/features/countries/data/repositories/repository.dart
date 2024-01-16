part of '../../countries.exports.dart';

final class CountriesRepository {
  /// rds: Remote Data Source
  final CountriesRDS _rds;

  static CountriesRepository? _instance;
  CountriesRepository._({CountriesRDS? rds}) : _rds = rds ?? CountriesRDS();
  factory CountriesRepository() => _instance ??= CountriesRepository._();

  Future<ResponseState> fetchCountries(PaginationParams params) async {
    try {
      final data = await _rds.fetchCountries(params);
      return SuccessResponse(data);
    } on APIErrorResponse catch (error) {
      return FailureResponse(error.message);
    }
  }
}
