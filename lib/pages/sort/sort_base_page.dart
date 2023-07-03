import 'package:algo_visualizer/cubits/sort/base_sort_cubit.dart';
import 'package:algo_visualizer/widgets/sort/sort_button_widget.dart';
import 'package:algo_visualizer/widgets/sort/sort_visualizer_widget.dart';
import 'package:algo_visualizer/widgets/speed_slider_widget.dart';
import 'package:flutter/material.dart';

class SortBasePage<T extends BaseSortCubit> extends StatefulWidget {
  final String title;
  const SortBasePage({Key? key, required this.title}) : super(key: key);

  @override
  State<SortBasePage<T>> createState() => _SortBasePageState<T>();
}

class _SortBasePageState<T extends BaseSortCubit> extends State<SortBasePage<T>> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: SortVisualizerWidget<T>(),
          ),
          SpeedSliderWidget<T, SortCubitState>(),
          const SizedBox(height: 24),
          SortButtonWidget<T>(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
