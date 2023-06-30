import 'package:algo_visualizer/cubits/search/base_search_cubit.dart';
import 'package:algo_visualizer/models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchIndicatorWidget<T extends BaseSearchCubit> extends StatefulWidget {
  final GlobalKey parentKey;
  const SearchIndicatorWidget({Key? key, required this.parentKey}) : super(key: key);

  @override
  State<SearchIndicatorWidget<T>> createState() => _SearchIndicatorWidgetState<T>();
}

class _SearchIndicatorWidgetState<T extends BaseSearchCubit> extends State<SearchIndicatorWidget<T>> {

  Offset? _position;

  Offset? _getIndicatorOffset(SearchModel number) {
    var pos = Offset.zero;
    try {
      final RenderBox rObject = number.key.currentContext?.findRenderObject() as RenderBox;
      final RenderBox parentObject = widget.parentKey.currentContext?.findRenderObject() as RenderBox;
      final parentPos = parentObject.localToGlobal(const Offset(0, 0));
      pos = -rObject.globalToLocal(parentPos);
    } catch (e) {
      print(e);
    }
    return pos;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, SearchCubitState>(
      builder: (context, state) {

        for (var number in state.numbers) {
          if (number.state == SearchState.search) {
            _position = _getIndicatorOffset(number);
            break;
          }
        }

        return AnimatedPositioned(
          left: _position?.dx,
          top: _position?.dy,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          child: Visibility(
            visible: state.isSearching && _position != null,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              )
            ),
          )
        );
      }
    );
  }
}
