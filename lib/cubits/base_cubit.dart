import 'package:algo_visualizer/utils/wait.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T> extends Cubit<T> {
  BaseCubit(super.initialState);
  double _executionSpeed = 0.5;
  double get executionSpeed => _executionSpeed;

  set executionSpeed(double speed) {
    if (speed > 1.0) {
      _executionSpeed = 1;
      return;
    }
    if (speed < 0) {
      _executionSpeed = 0;
      return;
    }
    _executionSpeed = speed;
    render(state);
  }
  void render(T state) {
    emit(state);
  }

  Future pause() async {
    await wait(speed: executionSpeed);
  }
}