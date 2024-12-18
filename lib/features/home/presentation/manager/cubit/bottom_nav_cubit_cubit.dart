import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_cubit_state.dart';

class BottomNavCubit extends Cubit<BottomNavCubitState> {
  BottomNavCubit() : super(BottomNavCubitActivate());
  bool isActive = false;
  void showMore() {
    if (isActive) {
      isActive = false;
      emit(BottomNavCubitInitial());
    } else {
      isActive = true;
      emit(BottomNavCubitActivate());
    }
  }
}
