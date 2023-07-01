import 'package:flutter/material.dart';

enum SearchState {
  open,
  discard,
  search,
  searched,
  found
}

class SearchModel {
  final int value;

  SearchModel(this.value);

  SearchState state = SearchState.open;
  Color color = Colors.black54;
  GlobalKey key = GlobalKey();

  void reset() {
    state = SearchState.open;
    color = Colors.black54;
  }

  void potential() {
    state = SearchState.search;
    color = Colors.blue;
  }

  void discard() {
    state = SearchState.discard;
    color = Colors.red;
  }

  void found() {
    state = SearchState.found;
    color = Colors.green;
  }

  void searched() {
    state = SearchState.searched;
  }
}