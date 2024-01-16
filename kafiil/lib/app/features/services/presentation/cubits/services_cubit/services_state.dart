part of 'services_cubit.dart';

class ServicesState extends Equatable {
  final List<ServiceModel> services;
  final List<ServiceModel> popularServices;

  final BlocStatus status;
  final String? error;
  final BlocStatus popularServicesStatus;
  final String? popularServicesError;

  const ServicesState({
    this.services = const [],
    this.popularServices = const [],
    this.status = BlocStatus.initial,
    this.error,
    this.popularServicesStatus = BlocStatus.initial,
    this.popularServicesError,
  });

  @override
  List<Object?> get props => [
        services,
        popularServices,
        status,
        error,
        popularServicesStatus,
        popularServicesError,
      ];

  String get errorMsg => error ?? '';
  String get popularServicesErrorMsg => popularServicesError ?? '';

  bool get rebuildServicesSection =>
      status.isLoading || status.isFailure || status.isSuccess;
  bool get rebuildPopularServicesSection =>
      popularServicesStatus.isLoading ||
      popularServicesStatus.isFailure ||
      popularServicesStatus.isSuccess;

  bool get showSharedErrorComponent =>
      status.isFailure && popularServicesStatus.isFailure;
  bool get showServicesErrorComponent =>
      status.isFailure && popularServicesStatus.isFailure == false;
  bool get showPopularServicesErrorComponent =>
      popularServicesStatus.isFailure && status.isFailure == false;

  ServicesState copyWith({
    List<ServiceModel>? services,
    List<ServiceModel>? popularServices,
    BlocStatus? status,
    String? error,
    BlocStatus? popularServicesStatus,
    String? popularServicesError,
  }) {
    return ServicesState(
      services: services ?? this.services,
      popularServices: popularServices ?? this.popularServices,
      status: status ?? this.status,
      error: error,
      popularServicesStatus:
          popularServicesStatus ?? this.popularServicesStatus,
      popularServicesError: popularServicesError,
    );
  }
}
