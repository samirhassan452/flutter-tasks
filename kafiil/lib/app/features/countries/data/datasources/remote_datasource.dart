part of '../../countries.exports.dart';

final class CountriesRDS {
  final ApiClient _client;

  static CountriesRDS? _instance;
  CountriesRDS._({ApiClient? client}) : _client = client ?? ApiClient();
  factory CountriesRDS() => _instance ??= CountriesRDS._();

  Future<CountriesModel> fetchCountries(PaginationParams params) async {
    try {
      final response = await APIResponseParser.execute(
        () => _client.dio.get(
          'test/country',
          queryParameters: params.toMap,
        ),
      );
      final result = APIResponseParser<CountriesModel>.fromMap(
        response.data,
        (data) => CountriesModel.fromMap(response.data),
      );
      return Future.value(result.data);
    } on APIErrorResponse catch (_) {
      rethrow;
    }
  }
}
