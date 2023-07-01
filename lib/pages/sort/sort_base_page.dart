import 'package:algo_visualizer/cubits/sort/base_sort_cubit.dart';
import 'package:algo_visualizer/widgets/sort/sort_button_widget.dart';
import 'package:algo_visualizer/widgets/sort/sort_visualizer_widget.dart';
import 'package:flutter/material.dart';

class SortBasePage<T extends BaseSortCubit> extends StatelessWidget {
  final String title;
  const SortBasePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: SortVisualizerWidget<T>(),
          ),
          SortButtonWidget<T>(),
        ],
      ),
    );
  }
}
