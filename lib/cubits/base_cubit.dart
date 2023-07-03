import 'package:algo_visualizer/utils/wait.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_state.dart';

abstract class BaseCubit<T extends BaseState> extends Cubit<T> {
  BaseCubit(super.initialState);
  double _executionSpeed = 0.5;
  double get executionSpeed => _executionSpeed;

  void setExecutionSpeed(double speed) {
    if (speed > 1.0) {
      _executionSpeed = 1;
      return;
    }
    if (speed < 0) {
      _executionSpeed = 0;
      return;
    }
    _executionSpeed = speed;
  }

  Future pause() async {
    await wait(speed: executionSpeed);
  }
}