part of '../../register.exports.dart';

final class RegisterRDS {
  final ApiClient _client;

  static RegisterRDS? _instance;
  RegisterRDS._({ApiClient? client}) : _client = client ?? ApiClient();
  factory RegisterRDS() => _instance ??= RegisterRDS._();

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
    // return await APIResponseParser.execute(
    //   () async => await _client.dio.get('test/user/who-am-i'),
    // ).then((value) {
    //   final result = APIResponseParser<DependenciesModel>.fromMap(
    //     value.data,
    //     (data) => DependenciesModel.fromMap(data),
    //   );
    //   return Future.value(result.data!);
    // }).catchError((error) => throw error);
  }

  Future<int> register(RegisterModel user) async {
    try {
      var formData = FormData.fromMap(user.toMap);
      final file =
          MultipartFile.fromBytes(user.avatar.bytes, filename: 'avatar');
      formData.files.add(MapEntry('avatar', file));
      await APIResponseParser.execute(
        () => _client.dio.post('test/user/register', data: formData),
      );
      return Future.value(HttpStatus.ok);
    } on APIErrorResponse catch (_) {
      rethrow;
    }
  }
}
