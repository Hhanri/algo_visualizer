part of 'base_sort_cubit.dart';

@immutable
class SortCubitState {
  final List<SortModel> numbers;
  final bool isSorting;

  const SortCubitState({
    required this.numbers,
    required this.isSorting,
  });
}

