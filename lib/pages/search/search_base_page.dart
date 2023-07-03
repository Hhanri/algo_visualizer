import 'package:algo_visualizer/cubits/search/base_search_cubit.dart';
import 'package:algo_visualizer/widgets/search/search_indicator_widget.dart';
import 'package:algo_visualizer/widgets/search/search_text_widget.dart';
import 'package:algo_visualizer/widgets/search/search_visualizer_widget.dart';
import 'package:algo_visualizer/widgets/search/search_widget.dart';
import 'package:algo_visualizer/widgets/speed_slider_widget.dart';
import 'package:flutter/material.dart';

class SearchBasePage<T extends BaseSearchCubit> extends StatefulWidget {
  final String title;
  const SearchBasePage({Key? key, required this.title}) : super(key: key);

  @override
  State<SearchBasePage<T>> createState() => _SearchBasePageState<T>();
}

class _SearchBasePageState<T extends BaseSearchCubit> extends State<SearchBasePage<T>> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    GlobalKey key = GlobalKey(debugLabel: widget.title);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          SpeedSliderWidget<T, SearchCubitState>(),
          const SizedBox(height: 24),
          SearchTextWidget<T>(),
          const SizedBox(height: 24),
          SearchWidget<T>(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
