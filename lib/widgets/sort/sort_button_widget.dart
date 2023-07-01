import 'package:algo_visualizer/cubits/sort/base_sort_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortButtonWidget<T extends BaseSortCubit> extends StatelessWidget {
  const SortButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<T, SortCubitState, bool>(
      selector: (state) => state.isSorting,
      builder: (context, isSorting) {
        return ElevatedButton(
          onPressed: isSorting
            ? null
            : context.read<T>().sort,
          child: const Text("Sort")
        );
      }
    );
  }
}
