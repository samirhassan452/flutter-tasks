part of '../../shared_feature.exports.dart';

class PaginationParams extends Equatable {
  final int page;

  const PaginationParams({this.page = 1});

  @override
  List<Object?> get props => [page];

  Map<String, dynamic> get toMap => {"page": page};

  PaginationParams copyWith({
    int? page,
  }) {
    return PaginationParams(
      page: page ?? this.page,
    );
  }
}

//!
class PaginationModel extends Equatable {
  final int count;
  final int total;
  final int perPage;
  final int currentPage;
  final int totalPages;

  const PaginationModel({
    required this.count,
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  List<Object?> get props => [count, total, perPage, currentPage, totalPages];

  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      count: map['count']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
      perPage: map['perPage']?.toInt() ?? 0,
      currentPage: map['currentPage']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
    );
  }

  PaginationModel copyWith({
    int? count,
    int? total,
    int? perPage,
    int? currentPage,
    int? totalPages,
  }) {
    return PaginationModel(
      count: count ?? this.count,
      total: total ?? this.total,
      perPage: perPage ?? this.perPage,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
