part of '../../who_am_i.exports.dart';

final class WhoAmIRDS {
  final ApiClient _client;

  static WhoAmIRDS? _instance;
  WhoAmIRDS._({ApiClient? client}) : _client = client ?? ApiClient();
  factory WhoAmIRDS() => _instance ??= WhoAmIRDS._();

  Future<DependenciesModel> fetchDependencies() async {
    try {
      final response = await APIResponseParser.execute(
        () => _client.dio.get('test/dependencies'),
      );
      final result = APIResponseParser<DependenciesModel>.fromMap(
        response.data,
        (data) => DependenciesModel.fromMap(data),
      );
      return Future.value(result.data);
    } on APIErrorResponse catch (_) {
      rethrow;
    }
  }

  Future<UserModel> whoAmI() async {
    try {
      final response = await APIResponseParser.execute(
        () => _client.dio.get('test/user/who-am-i'),
      );
      final result = APIResponseParser<UserModel>.fromMap(
        response.data,
        (data) => UserModel.fromMap(data),
      );
      return Future.value(result.data);
    } on APIErrorResponse catch (_) {
      rethrow;
    }
  }
}
