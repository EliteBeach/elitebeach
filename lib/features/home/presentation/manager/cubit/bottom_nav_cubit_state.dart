part of 'bottom_nav_cubit_cubit.dart';

@immutable
sealed class BottomNavCubitState extends Equatable {
  const BottomNavCubitState();

  @override
  List<Object?> get props => <Object?>[];
}

final class BottomNavCubitInitial extends BottomNavCubitState {
  const BottomNavCubitInitial();
}

final class BottomNavCubitActivate extends BottomNavCubitState {}

final class BottomNavChanged extends BottomNavCubitState {
  final int bottomNavActiveIndex = 0;
  const BottomNavChanged(bottomNavActiveIndex);
}
