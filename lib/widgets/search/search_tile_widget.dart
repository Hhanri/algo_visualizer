import 'package:algo_visualizer/models/search_model.dart';
import 'package:flutter/material.dart';

class SearchTileWidget extends StatelessWidget {
  final SearchModel number;
  const SearchTileWidget({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      key: number.key,
      duration: const Duration(milliseconds: 900),
      curve: Curves.ease,
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: number.state == SearchState.found
          ? Border.all(color: number.color)
          : null,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: CustomTextStyle(
        number: number,
      ),
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  final SearchModel number;
  const CustomTextStyle({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      style: TextStyle(
        fontSize: number.state == SearchState.searched || number.state == SearchState.discard
          ? 30
          : 42,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 1.7,
        color: number.color,
      ),
      child: Center(
        child: Text(number.value.toString()),
      ),
    );
  }
}
