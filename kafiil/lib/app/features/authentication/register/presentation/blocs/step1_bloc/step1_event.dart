part of 'step1_bloc.dart';

@immutable
sealed class RegisterStep1Event extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RegisterStep1OnChangeInfo extends RegisterStep1Event {
  final String? fName;
  final String? lName;
  final String? email;
  final String? password;
  final bool? showPassword;
  final String? confirmPassword;
  final bool? showConfirmPassword;
  final int? userType;

  RegisterStep1OnChangeInfo({
    this.fName,
    this.lName,
    this.email,
    this.password,
    this.showPassword,
    this.confirmPassword,
    this.showConfirmPassword,
    this.userType,
  });

  @override
  List<Object?> get props => [
        fName,
        lName,
        email,
        password,
        showPassword,
        confirmPassword,
        showConfirmPassword,
        userType,
      ];
}

final class RegisterStep1OnGetInfo extends RegisterStep1Event {}

final class RegisterStep1OnNext extends RegisterStep1Event {}
