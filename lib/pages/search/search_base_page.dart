import 'package:algo_visualizer/cubits/search/base_search_cubit.dart';
import 'package:algo_visualizer/widgets/search/search_indicator_widget.dart';
import 'package:algo_visualizer/widgets/search/search_text_widget.dart';
import 'package:algo_visualizer/widgets/search/search_visualizer_widget.dart';
import 'package:algo_visualizer/widgets/search/search_widget.dart';
import 'package:flutter/material.dart';

class SearchBasePage<T extends BaseSearchCubit> extends StatelessWidget {
  final String title;
  const SearchBasePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey(debugLabel: title);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 24),
          Expanded(
            child: Stack(
              key: key,
              children: [
                SearchVisualizerWidget<T>(),
                SearchIndicatorWidget<T>(parentKey: key,),
              ],
            ),
          ),
          SearchTextWidget<T>(),
          const SizedBox(height: 24),
          SearchWidget<T>(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
