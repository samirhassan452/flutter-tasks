part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final DependenciesModel? dependencies;

  final BlocStatus status;
  final String? error;
  const RegisterState({
    this.dependencies,
    this.status = BlocStatus.initial,
    this.error,
  });

  @override
  List<Object?> get props => [dependencies, status, error];

  List<LookupModel<int>> get userTypes => dependencies?.types ?? const [];
  List<LookupModel<int>> get tags => dependencies?.tags ?? const [];
  List<LookupModel<String>> get socialMedias =>
      dependencies?.socialMedia ?? const [];

  String get errorMsg => error ?? "";

  bool get reloadPage =>
      status.isGetLoading || status.isGetFailure || status.isGetSuccess;

  RegisterState copyWith({
    DependenciesModel? dependencies,
    BlocStatus? status,
    String? error,
  }) {
    return RegisterState(
      dependencies: dependencies ?? this.dependencies,
      status: status ?? this.status,
      error: error,
    );
  }
}
