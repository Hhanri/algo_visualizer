import 'package:flutter/material.dart';

enum SortState {
  open,
  sort,
  sorted,
  pivot,
}

class SortModel {
  final int value;

  SortModel(this.value);

  final GlobalKey key = GlobalKey();
  SortState state = SortState.open;
  Color color = Colors.black54;

  void reset() {
    state = SortState.open;
    color = Colors.black54;
  }

  void sort() {
    state = SortState.sort;
    color = Colors.blue;
  }

  void sorted() {
    state = SortState.sorted;
    color = Colors.green;
  }

  void pivot() {
    state = SortState.pivot;
    color = Colors.pink;
  }
}