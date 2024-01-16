import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/utils.exports.dart';
import '../../../../../_shared_feature_/shared_feature.exports.dart';
import '../register_bloc/register_bloc.dart';
import '../step1_bloc/step1_bloc.dart';

part 'step2_event.dart';
part 'step2_state.dart';

class RegisterStep2Bloc extends Bloc<RegisterStep2Event, RegisterStep2State> {
  final RegisterBloc _registerBloc;
  final RegisterStep1Bloc _registerStep1Bloc;
  RegisterStep2Bloc({
    required RegisterBloc registerBloc,
    required RegisterStep1Bloc registerStep1Bloc,
  })  : _registerBloc = registerBloc,
        _registerStep1Bloc = registerStep1Bloc,
        super(const RegisterStep2State()) {
    ///
    on<RegisterStep2OnChangeInfo>((event, emit) {
      emit(state.copyWith(
        about: event.about,
        selectedTags: event.tags,
        selectedSocialMedias: event.socialMedias,
        avatar: event.avatar,
        salary: event.salary,
        birthDate: event.birthDate,
        gender: event.gender,
        status: BlocStatus.infoChanged,
      ));
    });

    ///
    on<RegisterStep2OnGetInfo>((event, emit) async {
      await for (var registerState in _registerBloc.stream) {
        if (registerState.status.isGetSuccess) {
          emit(state.copyWith(
            status: BlocStatus.getSuccess,
            genders: [
              const LookupModel<int>(value: 0, label: 'male'),
              const LookupModel<int>(value: 1, label: 'female'),
            ],
            tags: _registerBloc.state.dependencies?.tags,
            socialMedias: _registerBloc.state.dependencies?.socialMedia,
          ));
        }
      }
      /* if (_registerBloc.state.status.isGetSuccess) {
        emit(state.copyWith(
          status: BlocStatus.getSuccess,
          genders: [
            const LookupModel<int>(value: 0, label: 'male'),
            const LookupModel<int>(value: 1, label: 'female'),
          ],
          tags: _registerBloc.state.dependencies?.tags,
          socialMedias: _registerBloc.state.dependencies?.socialMedia,
        ));
      } */
    });

    ///
    on<RegisterStep2OnSubmit>((event, emit) {
      emit(state.copyWith(status: BlocStatus.validationChecking));

      if (state.isFormValid) {
        emit(state.copyWith(status: BlocStatus.validationPassed));
        _registerBloc.add(RegisterOnRegister(
          fName: _registerStep1Bloc.state.fName!,
          lName: _registerStep1Bloc.state.lName!,
          about: state.about!,
          tags: state.selectedTags,
          favoriteSocialMedias: state.selectedSocialMedias,
          salary: state.salary,
          password: _registerStep1Bloc.state.password!,
          passwordConfirmation: _registerStep1Bloc.state.confirmPassword!,
          email: _registerStep1Bloc.state.email!,
          birthDate: state.formattedBirthDate!,
          gender: state.gender!,
          type: _registerStep1Bloc.state.userType!,
          avatar: state.avatar!,
        ));
      } else {
        emit(state.copyWith(status: BlocStatus.validationFailed));
      }
    });
  }
}
