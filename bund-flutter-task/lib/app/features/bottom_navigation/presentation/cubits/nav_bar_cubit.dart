part of '../../bottom_navigation.exports.dart';

class BottomNavBarCubit extends Cubit<BottomNavBar> {
  BottomNavBarCubit({required BottomNavBar initialNavBar})
      : super(initialNavBar);

  void onChangeBottomNavBar(int index) =>
      emit(BottomNavBar.values.elementAt(index));
}
