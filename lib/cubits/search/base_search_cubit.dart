import 'package:algo_visualizer/cubits/base_cubit.dart';
import 'package:algo_visualizer/models/search_model.dart';
import 'package:flutter/foundation.dart';

part 'search_cubit_state.dart';

class BaseSearchCubit extends BaseCubit<SearchCubitState> {
  BaseSearchCubit() : super(
    const SearchCubitState(
      numbers: [],
      currentPosition: 0,
      isSearching: false,
      foundPosition: null,
      speed: 0.5
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

  int _currentPosition = 0;
  bool _isSearching = false;
  int? _position;

  int get currentPosition => _currentPosition;
  bool get isSearching => _isSearching;
  int? get position => _position;

  set newPosition(int position) => _currentPosition = position;

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
    _currentPosition = index;
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

  @override
  void setExecutionSpeed(double speed) {
    super.setExecutionSpeed(speed);
    emitState();
  }

  void emitState() {
    emit(
      SearchCubitState(
        numbers: [...numbers],
        isSearching: isSearching,
        currentPosition: currentPosition,
        foundPosition: position,
        speed: executionSpeed
      )
    );
  }
}
