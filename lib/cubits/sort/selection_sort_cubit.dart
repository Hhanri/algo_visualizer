import 'package:algo_visualizer/cubits/sort/base_sort_cubit.dart';
import 'package:algo_visualizer/models/sort_model.dart';

class SelectionSortCubit extends BaseSortCubit {

  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  void _startSort(List<SortModel> list) async {

    for (int i = 0; i < list.length; i++) {
      await _markPivotAndRender(i);

      int smallest = i;

      for (int j = i + 1; j < list.length; j++) {
        await _markInterestedAndRender(j);
        if (list[j].value < list[smallest].value) {
          await _resetStateAndRender(smallest);
          smallest = j;
          await _markPivotAndRender(j);
        } else {
          await _resetStateAndRender(j);
        }
      }
      final tmp = list[i];
      list[i] = list[smallest];
      list[smallest] = tmp;
      await _markSortedAndRender(i);
    }
    markNodesAsSorted(0, numbers.length - 1);
    setStateToSorted();
    emitState();
  }

  Future<void> _resetStateAndRender(int index) async {
    markNodeAsNotSorted(index);
    emitState();
    await pause();
  }

  Future<void> _markInterestedAndRender(int index) async {
    markNodeForSorting(index);
    emitState();
    await pause();
  }

  Future<void> _markPivotAndRender(int index) async {
    markNodeAsPivot(index);
    emitState();
    await pause();
  }

  Future<void> _markSortedAndRender(int index) async {
    markNodeAsSorted(index);
    emitState();
    await pause();
  }

}