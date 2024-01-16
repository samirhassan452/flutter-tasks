part of '../../login.exports.dart';

class LoginModel extends Equatable {
  final String email;
  final String password;

  const LoginModel({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];

  Map<String, dynamic> get toMap => {'password': password, 'email': email};

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap);

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
