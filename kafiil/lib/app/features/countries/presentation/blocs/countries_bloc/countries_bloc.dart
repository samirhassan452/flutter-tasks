import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/utils.exports.dart' show BlocStatus;
import '../../../../_shared_feature_/shared_feature.exports.dart'
    show
        CountryModel,
        FailureResponse,
        PaginationModel,
        PaginationParams,
        SuccessResponse;
import '../../../countries.exports.dart' show CountriesRepository;

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CountriesRepository _repository;
  CountriesBloc()
      : _repository = CountriesRepository(),
        super(const CountriesState()) {
    ///
    on<CountriesOnFetch>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.getLoading));
      final result = await _repository.fetchCountries(_params);

      switch (result) {
        case SuccessResponse():
          final currentPage = result.data.pagination.currentPage;
          emit(state.copyWith(
            status: BlocStatus.getSuccess,
            countries: {...state.countries}
              ..putIfAbsent(currentPage, () => result.data.countries),
            pagination: result.data.pagination,
          ));
          break;
        case FailureResponse():
          emit(state.copyWith(
            status: BlocStatus.getFailure,
            error: result.message,
          ));
          break;
      }
    });

    ///
    on<CountriesOnFetchMore>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.loadMoreLoading));

      final result = await _repository.fetchCountries(_params);

      switch (result) {
        case SuccessResponse():
          final currentPage = result.data.pagination.currentPage;
          emit(state.copyWith(
            status: BlocStatus.loadMoreSuccess,
            countries: {...state.countries}
              ..putIfAbsent(currentPage, () => result.data.countries),
            pagination: result.data.pagination,
          ));
          break;
        case FailureResponse():
          emit(state.copyWith(
            status: BlocStatus.loadMoreFailure,
            error: result.message,
          ));
          break;
      }
    });

    ///
    on<CountriesOnGo>((event, emit) {
      final page = event.index;
      emit(state.copyWith(
        currentPage: page,
        previousPage: state.currentPage,
        status: BlocStatus.infoChanged,
      ));
      _checkCanLoadMore(page);
    });

    ///
    on<CountriesOnNext>((event, emit) {
      final page = (state.currentPage + 1).clamp(1, state.totalPages);
      emit(state.copyWith(
        currentPage: page,
        previousPage: state.currentPage,
        status: BlocStatus.infoChanged,
      ));
      _checkCanLoadMore(page);
    });

    ///
    on<CountriesOnLast>((event, emit) {
      final page = state.totalPages;
      emit(state.copyWith(
        currentPage: page,
        previousPage: state.currentPage,
        status: BlocStatus.infoChanged,
      ));
      _checkCanLoadMore(page);
    });

    ///
    on<CountriesOnPrev>((event, emit) {
      final page = (state.currentPage - 1).clamp(1, state.totalPages);
      emit(state.copyWith(
        currentPage: page,
        previousPage: state.currentPage,
        status: BlocStatus.infoChanged,
      ));
      _checkCanLoadMore(page);
    });

    ///
    on<CountriesOnFirst>((event, emit) {
      const page = 1;
      emit(state.copyWith(
        currentPage: 1,
        previousPage: state.currentPage,
        status: BlocStatus.infoChanged,
      ));
      _checkCanLoadMore(page);
    });
  }

  void _checkCanLoadMore(int page) {
    if (state.countries.containsKey(page) == false) {
      add(CountriesOnFetchMore());
    }
  }

  PaginationParams get _params => PaginationParams(page: state.currentPage);
}
