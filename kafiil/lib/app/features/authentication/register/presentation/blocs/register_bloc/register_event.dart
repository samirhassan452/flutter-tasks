part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterOnGetLookups extends RegisterEvent {}

class RegisterOnRegister extends RegisterEvent {
  final String fName;
  final String lName;
  final String about;
  final List<int> tags;
  final List<String> favoriteSocialMedias;
  final num salary;
  final String password;
  final String passwordConfirmation;
  final String email;
  final String birthDate;
  final int gender;
  final int type;
  final FileInfo avatar;

  const RegisterOnRegister({
    required this.fName,
    required this.lName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedias,
    required this.salary,
    required this.password,
    required this.passwordConfirmation,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.type,
    required this.avatar,
  });

  @override
  List<Object> get props => [
        fName,
        lName,
        about,
        tags,
        favoriteSocialMedias,
        salary,
        password,
        passwordConfirmation,
        email,
        birthDate,
        gender,
        type,
        avatar,
      ];
}
