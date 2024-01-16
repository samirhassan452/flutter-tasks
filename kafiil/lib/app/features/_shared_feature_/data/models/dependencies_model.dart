part of '../../shared_feature.exports.dart';

const _types = "types";
const _tags = "tags";
const _socialMedia = "social_media";

class DependenciesModel extends Equatable {
  final List<LookupModel<int>> types;
  final List<LookupModel<int>> tags;
  final List<LookupModel<String>> socialMedia;
  const DependenciesModel({
    required this.types,
    required this.tags,
    required this.socialMedia,
  });

  @override
  List<Object?> get props => [types, tags, socialMedia];

  factory DependenciesModel.fromMap(Map<String, dynamic> map) {
    return DependenciesModel(
      types: List<LookupModel<int>>.from(
        map[_types]?.map((x) => LookupModel<int>.fromMap(x)),
      ),
      tags: List<LookupModel<int>>.from(
        map[_tags]?.map((x) => LookupModel<int>.fromMap(x)),
      ),
      socialMedia: List<LookupModel<String>>.from(
        map[_socialMedia]?.map((x) => LookupModel<String>.fromMap(x)),
      ),
    );
  }

  DependenciesModel copyWith({
    List<LookupModel<int>>? types,
    List<LookupModel<int>>? tags,
    List<LookupModel<String>>? socialMedia,
  }) {
    return DependenciesModel(
      types: types ?? this.types,
      tags: tags ?? this.tags,
      socialMedia: socialMedia ?? this.socialMedia,
    );
  }
}
