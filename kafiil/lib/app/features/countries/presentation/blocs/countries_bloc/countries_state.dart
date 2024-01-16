part of 'countries_bloc.dart';

class CountriesState extends Equatable {
  final Map<int, List<CountryModel>> countries;
  final PaginationModel? pagination;

  final int currentPage;
  final int previousPage;

  final BlocStatus status;
  final String? error;

  const CountriesState({
    this.countries = const {},
    this.pagination,
    this.currentPage = 1,
    this.previousPage = 1,
    this.status = BlocStatus.initial,
    this.error,
  });

  bool get rebuildPage =>
      status.isGetLoading || status.isGetFailure || status.isGetSuccess;

  bool get rebuildTable =>
      status.isLoadMoreLoading ||
      status.isLoadMoreSuccess ||
      status.isLoadMoreFailure;

  // bool get canReadMore =>
  //     status.isLoadMoreLoading == false &&
  //     countries.isNotEmpty &&
  //     countries.length != pagination?.total &&
  //     pagination?.currentPage != pagination?.totalPages;

  int get totalPages => pagination?.totalPages ?? 1;

  String get errorMsg => error ?? '';

  @override
  List<Object?> get props =>
      [countries, pagination, currentPage, status, error];

  CountriesState copyWith({
    Map<int, List<CountryModel>>? countries,
    PaginationModel? pagination,
    int? currentPage,
    int? previousPage,
    BlocStatus? status,
    String? error,
  }) {
    return CountriesState(
      countries: countries ?? this.countries,
      pagination: pagination ?? this.pagination,
      currentPage: currentPage ?? this.currentPage,
      previousPage: previousPage ?? this.previousPage,
      status: status ?? this.status,
      error: error,
    );
  }
}
