part of 'login_bloc.dart';

class LoginState extends Equatable {
  final UserModel? user;

  final String? email;
  final String? password;
  final bool showPassword;
  final bool rememberMe;

  final BlocStatus status;
  final String? error;
  const LoginState({
    this.user,
    this.email,
    this.password,
    this.showPassword = false,
    this.rememberMe = false,
    this.status = BlocStatus.initial,
    this.error,
  });

  EmailValidator get emailValidator => EmailValidator(email);
  PasswordValidator get passwordValidator => PasswordValidator(password);

  String? get emailErr => emailValidator.notifyIfNotValid();
  String? get passwordErr => passwordValidator.notifyIfNotValid();

  bool get isFormValid =>
      Validator.arePassed([emailValidator, passwordValidator]);
  bool get isValidationFailed => status.isValidationFailed;

  String get errorMsg => error ?? "";

  @override
  List<Object?> get props =>
      [user, email, password, showPassword, rememberMe, status, error];

  LoginState copyWith({
    UserModel? user,
    String? email,
    String? password,
    bool? showPassword,
    bool? rememberMe,
    BlocStatus? status,
    String? error,
  }) {
    return LoginState(
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
      rememberMe: rememberMe ?? this.rememberMe,
      status: status ?? this.status,
      error: error,
    );
  }
}
