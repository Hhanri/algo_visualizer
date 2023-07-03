part of 'base_sort_cubit.dart';

@immutable
class SortCubitState {
  final List<SortModel> numbers;
  final bool isSorting;
  final double speed;

  const SortCubitState({
    required this.numbers,
    required this.isSorting,
    required this.speed,
  });
}

