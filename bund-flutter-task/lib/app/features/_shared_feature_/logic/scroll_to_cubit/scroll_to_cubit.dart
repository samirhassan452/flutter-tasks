part of '../../shared_feature.exports.dart';

/*  
  true: scroll to top
  false: scroll to bottom
*/
class ScrollToCubit extends Cubit<bool> {
  ScrollToCubit() : super(false);

  void onBackToInitial() => emit(false);

  void onCalculateOffset(double offset, [double condition = 400]) =>
      offset >= condition ? emit(true) : emit(false);
}
