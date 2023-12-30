part of '../../../home.exports.dart';

class PackagesCubit extends Cubit<PackagesState> {
  final HomeRepository _repository;
  PackagesCubit()
      : _repository = HomeRepository.instance,
        super(const PackagesState());

  void onFetchPackages() async {
    emit(const PackagesState(status: BlocStatus.loading));
    await Future.delayed(AppConfig.longDelayDuration);

    final result = await _repository.fetchPackages();

    switch (result) {
      case SuccessResponse():
        emit(PackagesState(
          status: BlocStatus.success,
          packages: result.data,
        ));
        break;
      case FailureResponse():
        emit(PackagesState(
          status: BlocStatus.failure,
          error: result.message,
        ));
        break;
    }
  }
}
