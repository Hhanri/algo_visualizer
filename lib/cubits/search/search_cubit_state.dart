part of 'base_search_cubit.dart';

class SearchCubitState {
  final List<SearchModel> numbers;
  final bool isSearching;
  final int? position;

  SearchCubitState({
    required this.numbers,
    required this.isSearching,
    required this.position
  });
}