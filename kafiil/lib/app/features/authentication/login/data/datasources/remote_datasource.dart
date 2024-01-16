part of '../../login.exports.dart';

final class LoginRDS {
  final ApiClient _client;

  static LoginRDS? _instance;
  LoginRDS._({ApiClient? client}) : _client = client ?? ApiClient();
  factory LoginRDS() => _instance ??= LoginRDS._();

  Future<UserModel> login(LoginModel model) async {
    try {
      final response = await APIResponseParser.execute(
        () => _client.dio.post('test/user/login', data: model.toMap),
      );
      final accessToken = response.data['access_token'];
      final result = APIResponseParser<UserModel>.fromMap(
        response.data,
        (data) => UserModel.fromMap(data, accessToken: accessToken),
      );
      return Future.value(result.data);
    } on APIErrorResponse catch (_) {
      rethrow;
    }
  }
}
