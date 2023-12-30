part of '../../../fixed_income.exports.dart';

class BondsState extends Equatable {
  final List<BondInfoModel> bonds;
  final BlocStatus status;
  final String? error;
  const BondsState({
    this.bonds = const [],
    this.status = BlocStatus.initial,
    this.error,
  });

  String get errorMessage => error ?? "";
  bool get rebuildBonds =>
      status.isLoading || status.isSuccess || status.isFailure;

  @override
  List<Object?> get props => [bonds, status, error];

  BondsState copyWith({
    List<BondInfoModel>? bonds,
    BlocStatus? status,
    String? error,
  }) {
    return BondsState(
      bonds: bonds ?? this.bonds,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
