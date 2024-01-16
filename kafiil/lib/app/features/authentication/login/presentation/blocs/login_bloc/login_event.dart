part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginOnChangeInfo extends LoginEvent {
  final String? email;
  final String? password;
  final bool? showPassword;
  final bool? rememberMe;
  const LoginOnChangeInfo({
    this.email,
    this.password,
    this.showPassword,
    this.rememberMe,
  });

  @override
  List<Object?> get props => [email, password, showPassword, rememberMe];
}

class LoginOnGetInfo extends LoginEvent {
  const LoginOnGetInfo();
}

class LoginOnSubmit extends LoginEvent {
  const LoginOnSubmit();
}
