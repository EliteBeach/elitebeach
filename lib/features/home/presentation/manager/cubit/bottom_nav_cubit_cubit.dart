import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_cubit_state.dart';

class BottomNavCubit extends Cubit<BottomNavCubitState> {
  BottomNavCubit() : super(BottomNavCubitActivate());
  bool isActive = false;
  int activeBottomNavIndex = 0;
  String startDate = '';
  String endDate = '';

  void updateUi(int index) {
    emit(const BottomNavCubitInitial());
    activeBottomNavIndex = index;
    emit(BottomNavChanged(activeBottomNavIndex));
  }

  void updateDateUi({required String selectedDate, required bool isStart}) {
    emit(const BottomNavCubitInitial());
    isStart ? startDate = selectedDate : endDate = selectedDate;
    emit(const ChangeDateState());
  }
}
