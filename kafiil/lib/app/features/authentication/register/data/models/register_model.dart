part of '../../register.exports.dart';

class RegisterModel extends Equatable {
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

  const RegisterModel({
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
  List<Object?> get props => [
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

  Map<String, dynamic> get toMap => {
        'first_name': fName,
        'last_name': lName,
        'about': about,
        for (int index = 0; index < tags.length; index++)
          'tags[$index]': tags[index],
        for (int index = 0; index < favoriteSocialMedias.length; index++)
          'favorite_social_media[$index]': favoriteSocialMedias[index],
        'salary': salary,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'email': email,
        'birth_date': birthDate,
        'gender': gender,
        'type': type,
      };
}
