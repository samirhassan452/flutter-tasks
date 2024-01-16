part of '../shared_feature.exports.dart';

sealed class ResponseState extends Equatable {
  final List properties;
  const ResponseState([this.properties = const <Object?>[]]);

  @override
  List<Object?> get props => properties;
}

final class SuccessResponse<T> extends ResponseState {
  final T data;
  SuccessResponse(this.data) : super([data]);
}

final class FailureResponse extends ResponseState {
  final String message;
  FailureResponse(this.message) : super([message]);
}
