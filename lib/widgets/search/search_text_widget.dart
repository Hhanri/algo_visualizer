import 'package:algo_visualizer/cubits/search/base_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextWidget<T extends BaseSearchCubit> extends StatefulWidget {
  const SearchTextWidget({Key? key}) : super(key: key);

  @override
  State<SearchTextWidget<T>> createState() => _SearchTextWidget<T>();
}

class _SearchTextWidget<T extends BaseSearchCubit> extends State<SearchTextWidget<T>> {

  String getMessage(int position) {
    if (position == -1) {
      return 'Value not found';
    }
    return 'Value found at position: ${(position + 1).toString()}';
  }

  Color getColor(int position) {
    if (position == -1) {
      return Colors.red;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<T, SearchCubitState, int?>(
      selector: (state) => state.foundPosition,
      builder: (context, position) {
        if (position == null) return const SizedBox.shrink();
        return SizedBox(
          height: 50,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 24,
              color: getColor(position),
            ),
            child: Text(getMessage(position)),
          ),
        );
      }
    );
  }
}
