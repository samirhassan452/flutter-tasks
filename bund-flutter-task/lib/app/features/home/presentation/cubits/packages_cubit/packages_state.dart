part of '../../../home.exports.dart';

class PackagesState extends Equatable {
  final List<PackageInfoModel> packages;
  final BlocStatus status;
  final String? error;
  const PackagesState({
    this.packages = const [],
    this.status = BlocStatus.initial,
    this.error,
  });

  String get errorMessage => error ?? "";
  bool get rebuildPackages =>
      status.isLoading || status.isSuccess || status.isFailure;

  int get length => packages.length;

  @override
  List<Object?> get props => [packages, status, error];

  PackagesState copyWith({
    List<PackageInfoModel>? packages,
    BlocStatus? status,
    String? error,
  }) {
    return PackagesState(
      packages: packages ?? this.packages,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
