part of 'entry_point_cubit.dart';

class EntryPointState extends Equatable {
  // final UserModel? user;
  final String? accessToken;
  final LoginModel? login;

  final BlocStatus status;
  final BlocStatus loginStatus;
  final String? error;
  final String? loginError;
  const EntryPointState({
    // this.user,
    this.accessToken,
    this.login,
    this.status = BlocStatus.initial,
    this.loginStatus = BlocStatus.initial,
    this.error,
    this.loginError,
  });

  @override
  List<Object?> get props =>
      [accessToken, login, status, loginStatus, error, loginError];

  bool get isAuthenticated => accessToken != null && accessToken!.isNotEmpty;
  bool get isRememberedMe => login != null;

  EntryPointState clearAuth() => EntryPointState(
        accessToken: accessToken,
        login: null,
        status: status,
        loginStatus: BlocStatus.postSuccess,
        error: error,
        loginError: loginError,
      );

  EntryPointState copyWith({
    // UserModel? user,
    String? accessToken,
    LoginModel? login,
    BlocStatus? status,
    BlocStatus? loginStatus,
    String? error,
    String? loginError,
  }) {
    return EntryPointState(
      // user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      login: login ?? this.login,
      status: status ?? this.status,
      loginStatus: loginStatus ?? this.loginStatus,
      error: error,
      loginError: loginError,
    );
  }
}
