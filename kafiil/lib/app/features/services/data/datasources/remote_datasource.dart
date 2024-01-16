part of '../../services.exports.dart';

final class ServicesRDS {
  final ApiClient _client;

  static ServicesRDS? _instance;
  ServicesRDS._({ApiClient? client}) : _client = client ?? ApiClient();
  factory ServicesRDS() => _instance ??= ServicesRDS._();

  Future<ServicesModel> fetchServices() async {
    try {
      final response = await APIResponseParser.execute(
        () => _client.dio.get('test/service'),
      );
      final result = APIResponseParser<ServicesModel>.fromMap(
        response.data,
        (data) => ServicesModel.fromMap(data),
      );
      return Future.value(result.data);
    } on APIErrorResponse catch (_) {
      rethrow;
    }
  }

  Future<ServicesModel> fetchPopularServices() async {
    try {
      final response = await APIResponseParser.execute(
        () => _client.dio.get('test/service/popular'),
      );
      final result = APIResponseParser<ServicesModel>.fromMap(
        response.data,
        (data) => ServicesModel.fromMap(data),
      );
      return Future.value(result.data);
    } on APIErrorResponse catch (_) {
      rethrow;
    }
  }
}
