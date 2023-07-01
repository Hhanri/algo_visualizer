import 'package:algo_visualizer/cubits/sort/quick_sort_cubit.dart';
import 'package:algo_visualizer/pages/sort/sort_base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickSortPage extends StatelessWidget {
  const QuickSortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuickSortCubit>(
      create: (context) => QuickSortCubit()..init(),
      child: const SortBasePage<QuickSortCubit>(title: 'QuickSort'),
    );
  }
}
