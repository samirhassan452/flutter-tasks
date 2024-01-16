import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/app/core/utils/utils.exports.dart';

import '../../../../../_shared_feature_/shared_feature.exports.dart';
import '../../../register.exports.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository _repository;
  RegisterBloc()
      : _repository = RegisterRepository(),
        super(const RegisterState()) {
    ///
    on<RegisterOnGetLookups>((event, emit) async {
      emit(const RegisterState(status: BlocStatus.getLoading));

      final result = await _repository.fetchDependencies();

      switch (result) {
        case SuccessResponse():
          emit(RegisterState(
            status: BlocStatus.getSuccess,
            dependencies: result.data,
          ));
          break;
        case FailureResponse():
          emit(RegisterState(
            status: BlocStatus.getFailure,
            error: result.message,
          ));
          break;
      }
    });

    ///
    on<RegisterOnRegister>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.postLoading));
      await Future.delayed(const Duration(milliseconds: 300));

      final user = RegisterModel(
        fName: event.fName,
        lName: event.lName,
        about: event.about,
        tags: event.tags,
        favoriteSocialMedias: event.favoriteSocialMedias,
        salary: event.salary,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
        email: event.email,
        birthDate: event.birthDate,
        gender: event.gender,
        type: event.type,
        avatar: event.avatar,
      );

      final result = await _repository.register(user);

      emit(state.copyWith(status: BlocStatus.closeLoading));
      switch (result) {
        case SuccessResponse():
          emit(state.copyWith(status: BlocStatus.postSuccess));
          break;
        case FailureResponse():
          emit(state.copyWith(
            status: BlocStatus.postFailure,
            error: result.message,
          ));
          break;
      }
    });
  }
}
