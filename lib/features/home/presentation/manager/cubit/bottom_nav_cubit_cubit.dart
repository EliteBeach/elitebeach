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

  void updateUi(int index) {
    //home screen
    if (index == 0) {
      emit(const BottomNavCubitInitial());
      activeBottomNavIndex = 0;
      emit(BottomNavChanged(activeBottomNavIndex));
    }
    //about screen
    if (index == 1) {
      emit(const BottomNavCubitInitial());
      activeBottomNavIndex = 1;
      emit(BottomNavChanged(activeBottomNavIndex));
    }
    //
    if (index == 2) {
      emit(const BottomNavCubitInitial());
      activeBottomNavIndex = 2;
      emit(BottomNavChanged(activeBottomNavIndex));
    }
    if (index == 3) {
      emit(const BottomNavCubitInitial());
      activeBottomNavIndex = 3;
      emit(BottomNavChanged(activeBottomNavIndex));
    }
    if (index == 4) {
      emit(const BottomNavCubitInitial());
      activeBottomNavIndex = 4;
      emit(BottomNavChanged(activeBottomNavIndex));
    }
  }
}
