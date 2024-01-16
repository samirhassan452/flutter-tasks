import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/utils.exports.dart' show BlocStatus;
import '../../../../../_shared_feature_/shared_feature.exports.dart'
    show
        EmailValidator,
        FailureResponse,
        PasswordValidator,
        SuccessResponse,
        UserModel,
        Validator;
import '../../../../../entry_point/entry_point.exports.dart'
    show EntryPointCubit;
import '../../../login.exports.dart' show LoginModel, LoginRepository;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final EntryPointCubit _entryPointCubit;
  final LoginRepository _repository;
  LoginBloc({required EntryPointCubit entryPointCubit})
      : _entryPointCubit = entryPointCubit,
        _repository = LoginRepository(),
        super(const LoginState()) {
    ///
    on<LoginOnChangeInfo>((event, emit) {
      emit(state.copyWith(
        email: event.email,
        password: event.password,
        showPassword: event.showPassword,
        rememberMe: event.rememberMe,
        status: BlocStatus.infoChanged,
      ));
    });

    ///
    on<LoginOnGetInfo>((event, emit) {
      emit(LoginState(
        email: _entryPointCubit.state.login?.email,
        password: _entryPointCubit.state.login?.password,
        rememberMe: _entryPointCubit.state.isRememberedMe,
        status: BlocStatus.infoChanged,
      ));
    });

    ///
    on<LoginOnSubmit>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.validationChecking));

      if (state.isFormValid) {
        emit(state.copyWith(status: BlocStatus.validationPassed));

        emit(state.copyWith(status: BlocStatus.postLoading));
        final result = await _repository.login(model);
        emit(state.copyWith(status: BlocStatus.closeLoading));
        switch (result) {
          case SuccessResponse():
            await _entryPointCubit.persistToken(result.data);
            if (state.rememberMe) {
              await _entryPointCubit.persistAuth(model);
            } else {
              await _entryPointCubit.clearAuth();
            }
            emit(state.copyWith(
              status: BlocStatus.postSuccess,
              user: result.data,
            ));
            break;
          case FailureResponse():
            emit(state.copyWith(
              status: BlocStatus.postFailure,
              error: result.message,
            ));
            break;
        }
      } else {
        emit(state.copyWith(status: BlocStatus.validationFailed));
      }
    });
  }

  LoginModel get model =>
      LoginModel(email: state.email!, password: state.password!);
}
