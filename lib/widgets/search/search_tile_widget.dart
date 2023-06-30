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
          ? Border.all(color: Colors.green)
          : null,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: CustomTextStyle(
        fontSize: number.state == SearchState.searched ? 20 : 42,
        number: number,
        numberValue: number.value.toString(),
        state: number.state
      ),
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  final double fontSize;
  final SearchModel number;
  final String numberValue;
  final SearchState state;
  const CustomTextStyle({
    Key? key,
    required this.fontSize,
    required this.number,
    required this.numberValue,
    required this.state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      style: TextStyle(
        fontSize: fontSize,
        decoration: (state == SearchState.discard)
          ? TextDecoration.lineThrough
          : TextDecoration.none,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 1.7,
        color: number.color,
      ),
      child: Center(
        child: Text(numberValue),
      ),
    );
  }
}
