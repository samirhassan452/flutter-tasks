part of 'step1_bloc.dart';

@immutable
class RegisterStep1State extends Equatable {
  final List<LookupModel<int>> userTypes;

  final bool showPassword;
  final bool showConfirmPassword;
  final String? fName;
  final String? lName;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final int? userType;

  final BlocStatus status;
  final String? error;

  const RegisterStep1State({
    this.userTypes = const [],
    this.fName,
    this.lName,
    this.email,
    this.password,
    this.showPassword = false,
    this.confirmPassword,
    this.showConfirmPassword = false,
    this.userType,
    this.status = BlocStatus.initial,
    this.error,
  });

  @override
  List<Object?> get props => [
        userTypes,
        fName,
        lName,
        email,
        password,
        showPassword,
        confirmPassword,
        showConfirmPassword,
        userType,
        status,
        error,
      ];

  NameValidator get fNameValidator => NameValidator(fName);
  NameValidator get lNameValidator => NameValidator(lName);
  EmailValidator get emailValidator => EmailValidator(email);
  PasswordValidator get passwordValidator => PasswordValidator(password);
  ConfirmPasswordValidator get confirmPasswordValidator =>
      ConfirmPasswordValidator(confirmPassword, basePassword: password);
  UserTypeValidator get userTypeValidator => UserTypeValidator(userType);

  String? get fNameErr => fNameValidator.notifyIfNotValid();
  String? get lNameErr => lNameValidator.notifyIfNotValid();
  String? get emailErr => emailValidator.notifyIfNotValid();
  String? get passwordErr => passwordValidator.notifyIfNotValid();
  String? get confirmPasswordErr => confirmPasswordValidator.notifyIfNotValid();
  String? get userTypeErr => userTypeValidator.notifyIfNotValid();

  bool get isFormValid => Validator.arePassed([
        fNameValidator,
        lNameValidator,
        emailValidator,
        passwordValidator,
        confirmPasswordValidator,
        userTypeValidator,
      ]);
  bool get isValidationFailed => status.isValidationFailed;

  String get errorMsg => error ?? "";

  RegisterStep1State copyWith({
    List<LookupModel<int>>? userTypes,
    bool? showPassword,
    bool? showConfirmPassword,
    String? fName,
    String? lName,
    String? email,
    String? password,
    String? confirmPassword,
    int? userType,
    BlocStatus? status,
    String? error,
  }) {
    return RegisterStep1State(
      userTypes: userTypes ?? this.userTypes,
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      userType: userType ?? this.userType,
      status: status ?? this.status,
      error: error,
    );
  }
}
