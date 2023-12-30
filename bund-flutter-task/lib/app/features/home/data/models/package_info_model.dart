part of '../../home.exports.dart';

class PackageInfoModel extends Equatable {
  const PackageInfoModel({
    required this.id,
    required this.package,
    required this.icon,
    required this.website,
  });

  final int id;
  final String package;
  final String icon;
  final String website;

  factory PackageInfoModel.fromMap(Map<String, dynamic> map) {
    return PackageInfoModel(
      id: map['id'] ?? 0,
      package: map['package'] ?? '',
      icon: map['icon'] ?? '',
      website: map['website'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, package, icon, website];
}
