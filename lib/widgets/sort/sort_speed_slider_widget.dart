import 'package:algo_visualizer/cubits/sort/base_sort_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortSpeedSliderWidget<T extends BaseSortCubit> extends StatelessWidget {
  const SortSpeedSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('SPEED'),
        BlocSelector<T, SortCubitState, double>(
          selector: (state) => state.speed,
          builder: (context, speed) {
            return Slider(
              min: 0,
              max: 1,
              divisions: 10,
              value: speed,
              onChanged: context.read<T>().setExecutionSpeed
            );
          }
        )
      ],
    );
  }
}
