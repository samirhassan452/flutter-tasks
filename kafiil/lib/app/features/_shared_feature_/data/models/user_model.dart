part of '../../shared_feature.exports.dart';

const _id = "id";
const _typeCode = "code";
const _firstName = "first_name";
const _lastName = "last_name";
const _name = "name";
const _niceName = "nice_name";
const _about = "about";
const _userTags = "tags";
const _favoriteSocialMedia = "favorite_social_media";
const _salary = "salary";
const _email = "email";
const _birthDate = "birth_date";
const _gender = "gender";
const _type = "type";
const _avatar = "avatar";

class UserModel extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String about;
  final List<UserTagsModel> tags;
  final List<String> favoriteSocialMedia;
  final num salary;
  final String email;
  final String birthDate;
  final int gender;
  final UserTypeModel type;
  final String avatar;
  final String accessToken;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.type,
    required this.avatar,
    required this.accessToken,
  });

  DateTime get birthDateAsDate => birthDate.fromDateFormate();

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        about,
        tags,
        favoriteSocialMedia,
        salary,
        email,
        birthDate,
        gender,
        type,
        avatar,
        accessToken,
      ];

  factory UserModel.fromMap(
    Map<String, dynamic> map, {
    String accessToken = '',
  }) {
    return UserModel(
      id: map[_id]?.toInt() ?? 0,
      firstName: map[_firstName] ?? '',
      lastName: map[_lastName] ?? '',
      about: map[_about] ?? '',
      tags: List<UserTagsModel>.from(
        map[_userTags]?.map((x) => UserTagsModel.fromMap(x)),
      ),
      favoriteSocialMedia: List<String>.from(
        map[_favoriteSocialMedia]?.map((x) => x),
      ),
      salary: map[_salary],
      email: map[_email] ?? '',
      birthDate: map[_birthDate] ?? '',
      gender: map[_gender]?.toInt() ?? 0,
      type: UserTypeModel.fromMap(map[_type]),
      avatar: map[_avatar] ?? '',
      accessToken: accessToken,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "about": about,
        "tags": List<dynamic>.from(tags.map((x) => x.toMap())),
        "favorite_social_media":
            List<dynamic>.from(favoriteSocialMedia.map((x) => x)),
        "salary": salary,
        "email": email,
        "birth_date": birthDate,
        "gender": gender,
        "type": type.toMap(),
        "avatar": avatar,
      };

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

//!
class UserTagsModel extends Equatable {
  final int id;
  final String name;

  const UserTagsModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  factory UserTagsModel.fromMap(Map<String, dynamic> map) {
    return UserTagsModel(
      id: map[_id]?.toInt() ?? 0,
      name: map[_name] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {"id": id, "name": name};
}

//!
class UserTypeModel extends Equatable {
  final int code;
  final String name;
  final String niceName;

  const UserTypeModel({
    required this.code,
    required this.name,
    required this.niceName,
  });

  @override
  List<Object?> get props => [code, name, niceName];

  factory UserTypeModel.fromMap(Map<String, dynamic> map) {
    return UserTypeModel(
      code: map[_typeCode]?.toInt() ?? 0,
      name: map[_name] ?? '',
      niceName: map[_niceName] ?? '',
    );
  }

  Map<String, dynamic> toMap() =>
      {"code": code, "name": name, "nice_name": niceName};
}
