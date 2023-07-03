part of 'base_sort_cubit.dart';

@immutable
class SortCubitState extends BaseState {
  final List<SortModel> numbers;
  final bool isSorting;

  const SortCubitState({
    required super.speed,
    required this.numbers,
    required this.isSorting,
  });
}

