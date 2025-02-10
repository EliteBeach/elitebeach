import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_cubit_state.dart';

class BottomNavCubit extends Cubit<BottomNavCubitState> {
  BottomNavCubit() : super(BottomNavCubitActivate());
  bool isActive = false;
  int activeBottomNavIndex = 0;
  void showMore() {
    emit(const BottomNavCubitInitial());
    if (isActive) {
      isActive = false;
      emit(const BottomNavCubitInitial());
    } else {
      isActive = true;
      emit(BottomNavCubitActivate());
    }
  }

  void hideShowMore() {
    if (isActive) {
      isActive = false;
      emit(const BottomNavCubitInitial());
    }
  }

  void updateUi(int index) {
    emit(const BottomNavCubitInitial());
    activeBottomNavIndex = index;
    emit(BottomNavChanged(activeBottomNavIndex));
  }
}
