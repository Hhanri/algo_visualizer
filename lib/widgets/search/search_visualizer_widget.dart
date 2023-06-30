import 'package:algo_visualizer/cubits/search/base_search_cubit.dart';
import 'package:algo_visualizer/models/search_model.dart';
import 'package:algo_visualizer/widgets/search/search_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchVisualizerWidget<T extends BaseSearchCubit> extends StatelessWidget {
  const SearchVisualizerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<T, SearchCubitState, List<SearchModel>>(
      selector: (state) => state.numbers,
      builder: (context, numbers) {
        return Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            for (var number in numbers) SearchTileWidget(number: number,)
          ],
        );
      }
    );
  }
}
