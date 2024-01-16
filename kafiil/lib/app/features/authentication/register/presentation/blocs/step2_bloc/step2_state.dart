part of 'step2_bloc.dart';

class RegisterStep2State extends Equatable {
  final List<LookupModel<int>> genders;
  final List<LookupModel<int>> tags;
  final List<LookupModel<String>> socialMedias;

  final FileInfo? avatar;
  final String? about;
  final num salary;
  final DateTime? birthDate;
  final int? gender;
  final List<int> selectedTags;
  final List<String> selectedSocialMedias;

  final BlocStatus status;
  final String? error;

  const RegisterStep2State({
    this.genders = const [],
    this.tags = const [],
    this.socialMedias = const [],
    this.avatar,
    this.about,
    this.salary = 100,
    this.birthDate,
    this.gender,
    this.selectedTags = const [],
    this.selectedSocialMedias = const [],
    this.status = BlocStatus.initial,
    this.error,
  });

  AboutValidator get aboutValidator => AboutValidator(about);
  BirthDateValidator get birthDateValidator =>
      BirthDateValidator(formattedBirthDate);

  String? get aboutErr => aboutValidator.notifyIfNotValid();
  String? get birthDateErr => birthDateValidator.notifyIfNotValid();

  bool get isFormValid =>
      Validator.arePassed([aboutValidator, birthDateValidator]) &&
      avatar != null &&
      gender != null &&
      selectedTags.isNotEmpty &&
      selectedSocialMedias.isNotEmpty;
  bool get isValidationFailed => status.isValidationFailed;

  String get errorMsg => error ?? "";

  String? get formattedBirthDate => birthDate?.toDateFormat();

  @override
  List<Object?> get props => [
        genders,
        tags,
        socialMedias,
        avatar,
        about,
        salary,
        birthDate,
        gender,
        selectedTags,
        selectedSocialMedias,
        status,
        error,
      ];

  RegisterStep2State copyWith({
    List<LookupModel<int>>? genders,
    List<LookupModel<int>>? tags,
    List<LookupModel<String>>? socialMedias,
    FileInfo? avatar,
    List<int>? avatarBytes,
    String? about,
    num? salary,
    DateTime? birthDate,
    int? gender,
    List<int>? selectedTags,
    List<String>? selectedSocialMedias,
    BlocStatus? status,
    String? error,
  }) {
    return RegisterStep2State(
      genders: genders ?? this.genders,
      tags: tags ?? this.tags,
      socialMedias: socialMedias ?? this.socialMedias,
      avatar: avatar ?? this.avatar,
      about: about ?? this.about,
      salary: salary ?? this.salary,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      selectedTags: selectedTags ?? this.selectedTags,
      selectedSocialMedias: selectedSocialMedias ?? this.selectedSocialMedias,
      status: status ?? this.status,
      error: error,
    );
  }
}
