import 'package:algo_visualizer/cubits/sort/base_sort_cubit.dart';
import 'package:algo_visualizer/models/sort_model.dart';

class BubbleSortCubit extends BaseSortCubit {

  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  void _startSort(List<SortModel> list) async {
    bool sorted = false;
    int counter = 0;

    while (!sorted) {
      sorted = true;
      for (int i = 0; i < list.length - 1 - counter; i++) {
        markNodesForSorting(i, i + 1);
        emitState();
        if (list[i].value > list[i + 1].value) {
          await pause();
          final tmp = list[i];
          list[i] = list[i + 1];
          list[i + 1] = tmp;
          sorted = false;
          emitState();
        }
        await pause();
        markNodeAsNotSorted(i);
      }
      markNodeAsSorted(list.length - 1 - counter);
      counter++;
    }
    markNodesAsSorted(0, list.length - 1 - counter);
    setStateToSorted();
    emitState();
  }

}