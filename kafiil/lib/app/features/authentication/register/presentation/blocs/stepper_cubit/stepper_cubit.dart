import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/utils.exports.dart' show RegisterSteps;

class StepperCubit extends Cubit<int> {
  StepperCubit() : super(RegisterSteps.register.index);

  void onNext() =>
      state < RegisterSteps.completeData.index ? emit(state + 1) : null;
  void onBack() =>
      state > RegisterSteps.register.index ? emit(state - 1) : null;

  bool get isFirstStep => state == RegisterSteps.register.index;
  bool get isLastStep => state == RegisterSteps.completeData.index;
}
