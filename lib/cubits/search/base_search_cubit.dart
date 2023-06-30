import 'package:algo_visualizer/cubits/base_cubit.dart';
import 'package:algo_visualizer/models/search_model.dart';
import 'package:flutter/foundation.dart';

part 'search_cubit_state.dart';

class BaseSearchCubit extends BaseCubit<SearchCubitState> {
  BaseSearchCubit() : super(
    SearchCubitState(
      numbers: [],
      isSearching: false,
      position: null
    )
  );

  final List<SearchModel> numbers = [
    SearchModel(0),
    SearchModel(1),
    SearchModel(4),
    SearchModel(11),
    SearchModel(19),
    SearchModel(22),
    SearchModel(34),
    SearchModel(35),
    SearchModel(38),
    SearchModel(39),
    SearchModel(44),
    SearchModel(46),
    SearchModel(47),
    SearchModel(49),
    SearchModel(57),
    SearchModel(62),
    SearchModel(69),
    SearchModel(74),
  ];

  void init() {
    emitState();
  }

  bool _isSearching = false;
  int? _position;

  bool get isSearching => _isSearching;
  int? get position => _position;

  @mustCallSuper
  void search({int value = 34}) {
    reset();
    _isSearching = true;
    emitState();
  }

  @protected
  void reset() {
    _isSearching = false;
    _position = null;
    for (var number in numbers) {
      number.reset();
    }
    emitState();
  }

  @protected
  void potentialNode(int index) {
    numbers[index].potential();
    emitState();
  }

  @protected
  void searchedNode(int index) {
    numbers[index].searched();
    emitState();
  }

  @protected
  void discardNode(int index) {
    numbers[index].discard();
    emitState();
  }

  @protected
  void discardNodes(int left, int right) {
    for (var index = left; index <= right; index++) {
      numbers[index].discard();
    }
    emitState();
  }

  @protected
  void foundNode(int index) {
    _isSearching = false;
    numbers[index].found();
    _position = index;
    emitState();
  }

  @protected
  void nodeNotFound() {
    _isSearching = false;
    _position = -1;
    emitState();
  }

  void emitState() {
    emit(
      SearchCubitState(
        numbers: numbers,
        isSearching: isSearching,
        position: position
      )
    );
  }
}
