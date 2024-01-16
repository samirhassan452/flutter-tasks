part of 'who_am_i_cubit.dart';

class WhoAmIState extends Equatable {
  final List<LookupModel<int>> userTypes;
  final List<LookupModel<int>> genders;
  final List<LookupModel<int>> tags;
  final List<LookupModel<String>> socialMedias;

  final String? password;
  final bool showPassword;

  final UserModel? user;
  final BlocStatus status;
  final String? error;

  const WhoAmIState({
    this.userTypes = const [],
    this.genders = const [],
    this.tags = const [],
    this.socialMedias = const [],
    this.password,
    this.showPassword = false,
    this.user,
    this.status = BlocStatus.initial,
    this.error,
  });

  bool get showPasswordField => password != null;

  @override
  List<Object?> get props => [
        userTypes,
        genders,
        tags,
        socialMedias,
        password,
        showPassword,
        user,
        status,
        error,
      ];

  String get errorMsg => error ?? '';

  bool get rebuildPage =>
      status.isLoading || status.isFailure || status.isSuccess;

  WhoAmIState copyWith({
    List<LookupModel<int>>? userTypes,
    List<LookupModel<int>>? genders,
    List<LookupModel<int>>? tags,
    List<LookupModel<String>>? socialMedias,
    String? password,
    bool? showPassword,
    UserModel? user,
    BlocStatus? status,
    String? error,
  }) {
    return WhoAmIState(
      userTypes: userTypes ?? this.userTypes,
      genders: genders ?? this.genders,
      tags: tags ?? this.tags,
      socialMedias: socialMedias ?? this.socialMedias,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
      user: user ?? this.user,
      status: status ?? this.status,
      error: error,
    );
  }
}
