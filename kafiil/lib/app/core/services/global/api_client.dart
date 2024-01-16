part of '../services.exports.dart';

final class ApiClient {
  late Dio dio;

  static ApiClient? _instance;
  ApiClient._({Dio? dio}) {
    this.dio = dio ?? Dio();
    this.dio
      ..options = BaseOptions(baseUrl: 'https://test.kafiil.com/api/')
      ..interceptors.add(BaseInterceptor(dio: this.dio));
  }
  factory ApiClient() => _instance ??= ApiClient._();
}

interface class BaseInterceptor extends Interceptor {
  final Dio dio;
  final InternetConnectionChecker _networkConnection;

  BaseInterceptor({
    required this.dio,
    InternetConnectionChecker? networkConnection,
  }) : _networkConnection = networkConnection ?? InternetConnectionChecker();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // super.onRequest(options, handler);

    // // print(accessToken);
    options.headers['Accept'] = 'application/json';
    options.headers['Accept-Language'] = 'en';

    if (AppConfig.isAuthenticated) {
      options.headers['Authorization'] = AppConfig.accessToken;
    }

    StringBuffer msg = StringBuffer();
    msg.writeln("--- On Sending Request ---");
    msg.writeln("----- URI: ${options.uri} -----");
    msg.writeln("----- Method: ${options.method} -----");
    msg.writeln("----- Headers: ${options.headers} -----");
    log(msg.toString());

    final isConnected = await _networkConnection.hasConnection;
    if (isConnected == false) {
      return handler.reject(
        DioException.connectionError(
          requestOptions: options,
          reason: 'No internet connection',
        ),
      );
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // super.onResponse(response, handler);

    StringBuffer msg = StringBuffer();
    msg.writeln("--- Voila!, Recieved Response ---");
    msg.writeln("----- URI: ${response.requestOptions.uri} -----");
    msg.writeln("----- Method: ${response.requestOptions.method} -----");
    msg.writeln("----- Data: ${response.data} -----");
    log(msg.toString());

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // super.onResponse(response, handler);

    StringBuffer msg = StringBuffer();
    msg.writeln("--- Opps!, Recieved Error ---");
    msg.writeln("----- URI: ${err.requestOptions.uri} -----");
    msg.writeln("----- Method: ${err.requestOptions.method} -----");
    msg.writeln("----- Data: ${err.response?.data} -----");
    log(msg.toString());

    return handler.reject(err);
  }
}
