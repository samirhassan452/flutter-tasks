part of '../../shared_feature.exports.dart';

class SliderCubit extends Cubit<int> {
  final int initialPage;
  SliderCubit({this.initialPage = 0}) : super(initialPage);

  void onUpdatePage(int index) => emit(index);
}
