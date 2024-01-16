import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.exports.dart';
import '../../../_shared_feature_/shared_feature.exports.dart';
import '../../../authentication/login/login.exports.dart';
import '../../entry_point.exports.dart';

part 'entry_point_state.dart';

class EntryPointCubit extends Cubit<EntryPointState> {
  final EntryPointRepository _repository;
  EntryPointCubit()
      : _repository = EntryPointRepository(),
        super(const EntryPointState());

  Future<void> onInit() async {
    await Future.wait([fetchToken(), fetchAuth()]);
  }

  Future<void> fetchToken() async {
    emit(state.copyWith(status: BlocStatus.getLoading));

    final result = await _repository.fetchToken();
    switch (result) {
      case SuccessResponse():
        emit(state.copyWith(
          status: BlocStatus.getSuccess,
          accessToken: result.data,
        ));
        break;
      case FailureResponse():
        emit(state.copyWith(
          status: BlocStatus.getFailure,
          error: result.message,
        ));
        break;
    }
  }

  Future<void> persistToken(UserModel user) async {
    final token = user.accessToken;

    emit(state.copyWith(status: BlocStatus.postLoading));
    final result = await _repository.persistToken(token);
    switch (result) {
      case SuccessResponse():
        emit(state.copyWith(
          status: BlocStatus.postSuccess,
          accessToken: token,
        ));
        break;
      case FailureResponse():
        emit(state.copyWith(
          status: BlocStatus.postFailure,
          error: result.message,
        ));
        break;
    }
  }

  Future<void> clearToken() async {
    emit(state.copyWith(status: BlocStatus.postLoading));
    await _repository.clearToken();
    emit(state.copyWith(status: BlocStatus.postSuccess, accessToken: ''));
  }

  /// Fetch LoginModel "Email & Password"
  Future<void> fetchAuth() async {
    emit(state.copyWith(loginStatus: BlocStatus.getLoading));

    final result = await _repository.fetchAuth();
    switch (result) {
      case SuccessResponse():
        emit(state.copyWith(
          loginStatus: BlocStatus.getSuccess,
          login: result.data,
        ));
        break;
      case FailureResponse():
        emit(state.copyWith(
          loginStatus: BlocStatus.getFailure,
          loginError: result.message,
        ));
        break;
    }
  }

  Future<void> persistAuth(LoginModel login) async {
    emit(state.copyWith(loginStatus: BlocStatus.postLoading));
    final result = await _repository.persistAuth(login);
    switch (result) {
      case SuccessResponse():
        emit(state.copyWith(
          loginStatus: BlocStatus.postSuccess,
          login: login,
        ));
        break;
      case FailureResponse():
        emit(state.copyWith(
          loginStatus: BlocStatus.postFailure,
          loginError: result.message,
        ));
        break;
    }
  }

  Future<void> clearAuth() async {
    emit(state.copyWith(loginStatus: BlocStatus.postLoading));
    await _repository.clearAuth();
    emit(state.clearAuth());
  }
}
