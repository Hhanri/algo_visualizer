import 'package:algo_visualizer/cubits/sort/insertion_sort_cubit.dart';
import 'package:algo_visualizer/pages/sort/sort_base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsertionSortPage extends StatelessWidget {
  const InsertionSortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InsertionSortCubit>(
      create: (context) => InsertionSortCubit()..init(),
      child: const SortBasePage<InsertionSortCubit>(title: 'InsertionSort'),
    );
  }
}
