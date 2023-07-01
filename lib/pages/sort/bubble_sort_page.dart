import 'package:algo_visualizer/cubits/sort/bubble_sort_cubit.dart';
import 'package:algo_visualizer/pages/sort/sort_base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BubbleSortPage extends StatelessWidget {
  const BubbleSortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BubbleSortCubit>(
      create: (context) => BubbleSortCubit()..init(),
      child: const SortBasePage<BubbleSortCubit>(title: 'BubbleSort'),
    );
  }
}
