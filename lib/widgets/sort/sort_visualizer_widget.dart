import 'package:algo_visualizer/cubits/sort/base_sort_cubit.dart';
import 'package:algo_visualizer/widgets/sort/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortVisualizerWidget<T extends BaseSortCubit> extends StatelessWidget {
  const SortVisualizerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, SortCubitState>(
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            for (int i = 0; i < state.numbers.length; i++)
              SortWidget(
                key: state.numbers[i].key,
                number: state.numbers[i],
                index: i
              )
          ],
        );
      }
    );
  }
}
