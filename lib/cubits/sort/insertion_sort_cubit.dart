import 'package:algo_visualizer/cubits/sort/base_sort_cubit.dart';
import 'package:algo_visualizer/models/sort_model.dart';

class InsertionSortCubit extends BaseSortCubit {

  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  void _startSort(List<SortModel> list) async {

    for (int i = 0; i < list.length; i++) {
      if (i > 1) {
        markNodesAsSorted(0, i - 2);
      }

      for (int j = i; j > 0 && list[j].value < list[j - 1].value; j--) {
        markNodesForSorting(j - 1, j);
        await pause();
        emitState();
        final tmp = list[j];
        list[j] = list[j - 1];
        list[j - 1] = tmp;
        markNodeAsNotSorted(j);
        emitState();
      }
    }

    markNodesAsSorted(0, list.length - 1);
    setStateToSorted();
    emitState();
  }

}