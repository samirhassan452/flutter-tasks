part of '../shared_feature.exports.dart';

// extension StringValidatorExtension on String? {
//   String? get hideValue => (this?.isNotEmpty ?? false) ? '' : this;
// }

abstract class Validator {
  String? validate();
  String? notifyIfNotValid();

  bool get isValid => validate() == null;
  static bool arePassed(List<Validator> validators) =>
      validators.every((validator) => validator.isValid);
}

class NameValidator extends Validator {
  final String? value;
  NameValidator(this.value);

  @override
  String? validate() => switch (value?.trim()) {
        (_) when value == null || value!.isEmpty => 'Cannot be empty',
        (_) when !Regex.name.hasMatch(value!) => 'Please enter a valid name',
        _ => null,
      };

  @override
  String? notifyIfNotValid() => value != null ? validate() : null;
}

class EmailValidator extends Validator {
  final String? value;
  EmailValidator(this.value);

  @override
  String? validate() => switch (value?.trim()) {
        (_) when value == null || value!.isEmpty => 'Cannot be empty',
        (_) when !Regex.email.hasMatch(value!) => 'Please enter a valid email',
        _ => null,
      };

  @override
  String? notifyIfNotValid() => value != null ? validate() : null;
}

class PasswordValidator extends Validator {
  final String? value;
  PasswordValidator(this.value);

  @override
  String? validate() => switch (value?.trim()) {
        (_) when value == null || value!.isEmpty => 'Cannot be empty',
        (_) when !Regex.password.hasMatch(value!) =>
          'Please enter a valid password',
        _ => null,
      };

  @override
  String? notifyIfNotValid() => value != null ? validate() : null;
}

class ConfirmPasswordValidator extends Validator {
  final String? value;
  final String? basePassword;
  ConfirmPasswordValidator(this.value, {required this.basePassword});

  @override
  String? validate() => switch (value?.trim()) {
        (_) when value == null || value!.isEmpty => 'Cannot be empty',
        (_) when value != basePassword => 'Passwords do not match',
        _ => null,
      };

  @override
  String? notifyIfNotValid() => value != null ? validate() : null;
}

class UserTypeValidator extends Validator {
  final int? value;
  UserTypeValidator(this.value);

  @override
  String? validate() => switch (value) {
        (_) when value == null || value! < 0 => 'Cannot be empty',
        _ => null,
      };

  @override
  String? notifyIfNotValid() => value != null ? validate() : null;
}

class AboutValidator extends Validator {
  final String? value;
  AboutValidator(this.value);

  @override
  String? validate() => switch (value?.trim()) {
        (_) when value == null || value!.isEmpty => 'Cannot be empty',
        (_) when !Regex.about.hasMatch(value!) => 'Please enter a valid info',
        _ => null,
      };

  @override
  String? notifyIfNotValid() => value != null ? validate() : null;
}

class BirthDateValidator extends Validator {
  final String? value;
  BirthDateValidator(this.value);

  @override
  String? validate() => switch (value?.trim()) {
        (_) when value == null || value!.isEmpty => 'Cannot be empty',
        _ => null,
      };

  @override
  String? notifyIfNotValid() => value != null ? validate() : null;
}
