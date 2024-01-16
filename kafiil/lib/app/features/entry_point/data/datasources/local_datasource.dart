part of '../../entry_point.exports.dart';

final class EntryPointLDS {
  final FlutterSecureStorage _secureStorage;

  static EntryPointLDS? _instance;
  EntryPointLDS._({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();
  factory EntryPointLDS() => _instance ??= EntryPointLDS._();

  Future<String> fetchToken() async {
    try {
      final token = await _secureStorage.read(key: PersistentKey.token);
      if (token == null) throw Exception('Token not found');
      return Future.value(token);
    } catch (e) {
      throw Exception('Failed to fetch Token');
    }
  }

  Future<void> persistToken(String token) async {
    try {
      return await _secureStorage.write(key: PersistentKey.token, value: token);
    } catch (e) {
      throw Exception('Failed to persist Token');
    }
  }

  Future<void> clearToken() async {
    try {
      return await _secureStorage.delete(key: PersistentKey.token);
    } catch (e) {
      throw Exception('Failed to clear Token');
    }
  }

  Future<LoginModel> fetchAuth() async {
    try {
      final encodedAuth = await _secureStorage.read(key: PersistentKey.auth);
      if (encodedAuth == null) throw Exception('Auth not found');
      final decodedAuth = LoginModel.fromJson(encodedAuth);
      return Future.value(decodedAuth);
    } catch (e) {
      throw Exception('Failed to fetch auth');
    }
  }

  Future<void> persistAuth(LoginModel login) async {
    try {
      return await _secureStorage.write(
        key: PersistentKey.auth,
        value: login.toJson(),
      );
    } catch (e) {
      throw Exception('Failed to persist auth');
    }
  }

  Future<void> clearAuth() async {
    try {
      return await _secureStorage.delete(key: PersistentKey.auth);
    } catch (e) {
      throw Exception('Failed to clear auth');
    }
  }
}
