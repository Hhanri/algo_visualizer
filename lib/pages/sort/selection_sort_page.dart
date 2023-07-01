import 'package:algo_visualizer/cubits/sort/selection_sort_cubit.dart';
import 'package:algo_visualizer/pages/sort/sort_base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionSortPage extends StatelessWidget {
  const SelectionSortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectionSortCubit>(
      create: (context) => SelectionSortCubit()..init(),
      child: const SortBasePage<SelectionSortCubit>(title: 'SelectionSort'),
    );
  }
}
