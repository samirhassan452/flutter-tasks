import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/utils.exports.dart';
import '../../../../../_shared_feature_/shared_feature.exports.dart';
import '../register_bloc/register_bloc.dart';
import '../stepper_cubit/stepper_cubit.dart';

part 'step1_event.dart';
part 'step1_state.dart';

class RegisterStep1Bloc extends Bloc<RegisterStep1Event, RegisterStep1State> {
  final StepperCubit _stepperCubit;
  final RegisterBloc _registerBloc;
  RegisterStep1Bloc({
    required StepperCubit stepperCubit,
    required RegisterBloc registerBloc,
  })  : _stepperCubit = stepperCubit,
        _registerBloc = registerBloc,
        super(const RegisterStep1State()) {
    ///
    on<RegisterStep1OnChangeInfo>((event, emit) {
      emit(state.copyWith(
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
        fName: event.fName,
        lName: event.lName,
        userType: event.userType,
        showPassword: event.showPassword,
        showConfirmPassword: event.showConfirmPassword,
        status: BlocStatus.infoChanged,
      ));
    });

    ///
    on<RegisterStep1OnGetInfo>((event, emit) async {
      _registerBloc.add(RegisterOnGetLookups());
      await for (var registerState in _registerBloc.stream) {
        if (registerState.status.isGetSuccess) {
          emit(state.copyWith(
            status: BlocStatus.getSuccess,
            userTypes: registerState.userTypes,
          ));
        }
      }
    });

    ///
    on<RegisterStep1OnNext>((event, emit) {
      emit(state.copyWith(status: BlocStatus.validationChecking));

      if (state.isFormValid) {
        emit(state.copyWith(status: BlocStatus.validationPassed));
        _stepperCubit.onNext();
      } else {
        emit(state.copyWith(status: BlocStatus.validationFailed));
      }
    });
  }
}
