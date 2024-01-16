part of 'step2_bloc.dart';

@immutable
sealed class RegisterStep2Event extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RegisterStep2OnChangeInfo extends RegisterStep2Event {
  final FileInfo? avatar;
  final String? about;
  final num? salary;
  final DateTime? birthDate;
  final int? gender;
  final List<int>? tags;
  final List<String>? socialMedias;

  RegisterStep2OnChangeInfo({
    this.avatar,
    this.about,
    this.salary,
    this.birthDate,
    this.gender,
    this.tags,
    this.socialMedias,
  });

  @override
  List<Object?> get props =>
      [avatar, about, salary, birthDate, gender, tags, socialMedias];
}

final class RegisterStep2OnGetInfo extends RegisterStep2Event {}

final class RegisterStep2OnSubmit extends RegisterStep2Event {}
