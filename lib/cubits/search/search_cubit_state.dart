part of 'base_search_cubit.dart';

class SearchCubitState {
  final List<SearchModel> numbers;
  final bool isSearching;
  final int currentPosition;
  final int? foundPosition;

  SearchCubitState({
    required this.numbers,
    required this.isSearching,
    required this.currentPosition,
    required this.foundPosition
  });
}