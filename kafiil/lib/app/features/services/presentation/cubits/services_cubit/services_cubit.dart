import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/utils.exports.dart' show BlocStatus;
import '../../../../_shared_feature_/shared_feature.exports.dart'
    show FailureResponse, ServiceModel, SuccessResponse;
import '../../../services.exports.dart' show ServicesRepository;

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepository _repository;
  ServicesCubit()
      : _repository = ServicesRepository(),
        super(const ServicesState());

  Future<void> onFetch() async {
    await Future.wait([
      onFetchServices(),
      onFetchPopularServices(),
    ]);
  }

  Future<void> onFetchServices() async {
    emit(state.copyWith(status: BlocStatus.loading));
    final services = await _repository.fetchServices();
    switch (services) {
      case SuccessResponse():
        emit(state.copyWith(
          status: BlocStatus.success,
          services: services.data.services,
        ));
        break;
      case FailureResponse():
        emit(state.copyWith(
          status: BlocStatus.failure,
          error: services.message,
        ));
        break;
    }
  }

  Future<void> onFetchPopularServices() async {
    emit(state.copyWith(popularServicesStatus: BlocStatus.loading));
    final services = await _repository.fetchPopularServices();
    switch (services) {
      case SuccessResponse():
        emit(state.copyWith(
          popularServicesStatus: BlocStatus.success,
          popularServices: services.data.services,
        ));
        break;
      case FailureResponse():
        emit(state.copyWith(
          popularServicesStatus: BlocStatus.failure,
          popularServicesError: services.message,
        ));
        break;
    }
  }
}
