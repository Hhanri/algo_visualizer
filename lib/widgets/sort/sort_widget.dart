import 'package:algo_visualizer/models/sort_model.dart';
import 'package:flutter/material.dart';

class SortWidget extends StatelessWidget {
  final SortModel number;
  final int index;
  const SortWidget({
    Key? key,
    required this.number,
    required this.index
  }) : super(key: key);

  Offset getPosition(double width, double widgetSize) {
    final horizontalFit = width ~/ widgetSize;
    final leftOver = width - (horizontalFit * widgetSize);
    final verticalIndex = index ~/ horizontalFit;
    final horizontalIndex = index % horizontalFit;
    return Offset((widgetSize * horizontalIndex) + leftOver / 2, widgetSize * verticalIndex);
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final widgetSize = width / 5;

    final double borderRadius = number.state == SortState.sort
      ? 40
      : 5;

    final double fontSize = number.state == SortState.sort
      ? 32
      : 20;

    final offset = getPosition(width, widgetSize);

    return AnimatedPositioned(
      top: offset.dy,
      left: offset.dx,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: SizedBox.square(
        dimension: widgetSize,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            decoration: BoxDecoration(
              border: Border.all(
                color: number.color,
                width: number.state == SortState.sorted ? 1 : 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
                style: TextStyle(
                  color: number.color,
                  fontSize: fontSize,
                ),
                child: Text(
                  number.value.toString(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
