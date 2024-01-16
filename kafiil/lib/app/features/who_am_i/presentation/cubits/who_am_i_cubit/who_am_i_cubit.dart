import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/utils.exports.dart' show BlocStatus;
import '../../../../_shared_feature_/shared_feature.exports.dart'
    show
        DependenciesModel,
        FailureResponse,
        LookupModel,
        ResponseState,
        SuccessResponse,
        UserModel;
import '../../../../entry_point/entry_point.exports.dart' show EntryPointCubit;
import '../../../who_am_i.exports.dart' show WhoAmIRepository;

part 'who_am_i_state.dart';

class WhoAmICubit extends Cubit<WhoAmIState> {
  final WhoAmIRepository _repository;
  final EntryPointCubit _entryPointCubit;
  WhoAmICubit({required EntryPointCubit entryPointCubit})
      : _repository = WhoAmIRepository(),
        _entryPointCubit = entryPointCubit,
        super(const WhoAmIState());

  void onShowPassword(bool showPassword) => emit(state.copyWith(
        showPassword: showPassword,
        status: BlocStatus.infoChanged,
      ));

  Future<void> onFetch() async {
    emit(state.copyWith(status: BlocStatus.loading));

    final responses = await Future.wait([
      _repository.fetchDependencies(),
      _repository.whoAmI(),
    ]);

    final error = _onCatchError(responses);
    if (error != null) {
      emit(state.copyWith(status: BlocStatus.failure, error: error));
      return;
    }

    final dependences = _onRefactorResponse<DependenciesModel>(responses[0]);
    final user = _onRefactorResponse<UserModel>(responses[1]);

    emit(state.copyWith(
      status: BlocStatus.success,
      user: user,
      userTypes: dependences?.types,
      tags: dependences?.tags,
      socialMedias: dependences?.socialMedia,
      genders: [
        const LookupModel<int>(value: 0, label: 'male'),
        const LookupModel<int>(value: 1, label: 'female'),
      ],
      password: _entryPointCubit.state.login?.password,
    ));

    /* switch (result) {
      case SuccessResponse():
        emit(state.copyWith(
          status: BlocStatus.success,
          user: result.data,
        ));
        break;
      case FailureResponse():
        emit(state.copyWith(
          status: BlocStatus.failure,
          error: result.message,
        ));
        break;
    } */
  }

  String? _onCatchError(List<ResponseState> responses) {
    String? msg;
    responses.every((response) {
      switch (response) {
        case FailureResponse():
          msg = response.message;
          return false;
        default:
          return true;
      }
    });
    return msg;
  }

  T? _onRefactorResponse<T>(ResponseState response) {
    switch (response) {
      case SuccessResponse():
        return response.data;
      case FailureResponse():
        return null;
    }
  }
}
