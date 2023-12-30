part of '../../fixed_income.exports.dart';

class BondInfoModel extends Equatable {
  const BondInfoModel({
    required this.id,
    required this.logo,
    required this.name,
    required this.degree,
    required this.website,
    required this.percentage,
  });

  final int id;
  final String logo;
  final String name;
  final String degree;
  final String website;
  final double percentage;

  factory BondInfoModel.fromMap(Map<String, dynamic> map) {
    return BondInfoModel(
      id: map['id'] ?? 0,
      logo: map['logo'] ?? '',
      name: map['name'] ?? '',
      degree: map['degree'] ?? '',
      website: map['website'] ?? '',
      percentage: map['percentage']?.toDouble() ?? 0.0,
    );
  }

  @override
  List<Object?> get props => [id, logo, name, degree, website, percentage];
}
