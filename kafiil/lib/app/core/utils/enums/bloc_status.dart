part of '../utils.exports.dart';

enum BlocStatus {
  initial,
  loading,
  success,
  failure,

  infoChanged,

  closeLoading,

  getLoading,
  getFailure,
  getSuccess,

  postLoading,
  postFailure,
  postSuccess,

  loadMoreLoading,
  loadMoreFailure,
  loadMoreSuccess,

  validationChecking,
  validationFailed,
  validationPassed,
  ;

  bool get isInitial => this == BlocStatus.initial;
  bool get isLoading => this == BlocStatus.loading;
  bool get isSuccess => this == BlocStatus.success;
  bool get isFailure => this == BlocStatus.failure;

  bool get isGetLoading => this == BlocStatus.getLoading;
  bool get isGetFailure => this == BlocStatus.getFailure;
  bool get isGetSuccess => this == BlocStatus.getSuccess;

  bool get isLoadMoreLoading => this == BlocStatus.loadMoreLoading;
  bool get isLoadMoreFailure => this == BlocStatus.loadMoreFailure;
  bool get isLoadMoreSuccess => this == BlocStatus.loadMoreSuccess;

  bool get isValidationFailed => this == BlocStatus.validationFailed;
}
