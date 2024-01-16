part of '../shared_feature.exports.dart';

const _status = 'status';
const _success = 'success';
const _code = 'code';
const _message = 'message';
const _data = 'data';
const _error = 'error';
const _errors = 'errors';

class APIResponseParser<T> {
  final int status;
  final bool success;
  final T? data;

  APIResponseParser({
    required this.status,
    required this.success,
    this.data,
  });

  List<Object?> get props => [status, success, data];

  factory APIResponseParser.fromMap(
    Map<String, dynamic> map, [
    T Function(dynamic)? fromJsonT,
  ]) {
    try {
      return APIResponseParser(
        status: map[_status]?.toInt() ?? 404,
        success: map[_success] ?? false,
        data: fromJsonT != null ? fromJsonT(map[_data]) : map[_data],
      );
    } catch (e) {
      throw FormatException(
        'Assign Value Exception occurred: $e',
        'APIResponseModel.fromMap()',
      );
    }
  }

  static Future<Response<dynamic>> execute(
    Future<Response<dynamic>> Function() callback,
  ) async {
    try {
      return await callback();
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
          throw APIErrorResponse(
            status: 400,
            code: 0,
            message: error.message ?? 'Connection Error',
          );
        default:
          throw APIErrorResponse.fromMap(error.response?.data);
      }
    } on FormatException catch (error) {
      throw APIErrorResponse(
        status: 400,
        code: 0,
        message: 'Unknown error occurred: $error',
      );
    } catch (_) {
      rethrow;
    }
  }
}

//!
class APIErrorResponse extends APIResponseParser {
  final int code;
  final String message;
  final dynamic errors;
  APIErrorResponse({
    super.success = false,
    required super.status,
    // required super.data,
    required this.code,
    required this.message,
    this.errors,
  });

  factory APIErrorResponse.fromMap(Map<String, dynamic> map) {
    try {
      return APIErrorResponse(
        status: map[_status]?.toInt() ?? 400,
        code: map.containsKey(_error) ? map[_error][_code]?.toInt() ?? 0 : 0,
        message: map.containsKey(_error)
            ? map[_error][_message] ?? 'Unknown/Bad error'
            : map[_message] ?? 'Unknown/Bad error',
        errors: map[_errors] ?? [],
      );
    } catch (e) {
      throw FormatException(
        'Assign Value Exception occurred: $e',
        'APIErrorResponse.fromMap()',
      );
    }
  }

  @override
  List<Object?> get props => [code, message];

  @override
  String toString() => 'APIErrorResponse(code: $code, message: $message)';
}
