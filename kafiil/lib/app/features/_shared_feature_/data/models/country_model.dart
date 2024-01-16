part of '../../shared_feature.exports.dart';

class CountriesModel extends Equatable {
  final List<CountryModel> countries;
  final PaginationModel pagination;

  const CountriesModel({required this.countries, required this.pagination});

  @override
  List<Object?> get props => [countries];

  factory CountriesModel.fromMap(Map<String, dynamic> map) {
    return CountriesModel(
      countries: map['data'] == null
          ? const []
          : List<CountryModel>.from(
              map['data'].map((x) => CountryModel.fromMap(x)),
            ),
      pagination: PaginationModel.fromMap(map['pagination']),
    );
  }
}

//!
class CountryModel extends Equatable {
  final int id;
  final String countryCode;
  final String name;
  final String capital;

  const CountryModel({
    required this.id,
    required this.countryCode,
    required this.name,
    required this.capital,
  });

  @override
  List<Object?> get props => [id, countryCode, name, capital];

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id']?.toInt() ?? 0,
      countryCode: map['country_code'] ?? '',
      name: map['name'] ?? '',
      capital: map['capital'] ?? '',
    );
  }

  CountryModel copyWith({
    int? id,
    String? countryCode,
    String? name,
    String? capital,
  }) {
    return CountryModel(
      id: id ?? this.id,
      countryCode: countryCode ?? this.countryCode,
      name: name ?? this.name,
      capital: capital ?? this.capital,
    );
  }
}
