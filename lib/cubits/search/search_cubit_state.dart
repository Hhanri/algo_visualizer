part of 'base_search_cubit.dart';

@immutable
class SearchCubitState extends BaseState {
  final List<SearchModel> numbers;
  final bool isSearching;
  final int currentPosition;
  final int? foundPosition;

  const SearchCubitState({
    required super.speed,
    required this.numbers,
    required this.isSearching,
    required this.currentPosition,
    required this.foundPosition,
  });
}