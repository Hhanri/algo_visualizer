import 'package:algo_visualizer/cubits/sort/base_sort_cubit.dart';
import 'package:algo_visualizer/models/sort_model.dart';

class QuickSortCubit extends BaseSortCubit {

  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  void _startSort(List<SortModel> list) async {
    await qs(list, 0, list.length - 1);
    markNodesAsSorted(0, list.length - 1);
    setStateToSorted();
    emitState();
  }

  Future<int> partition(List<SortModel> nums, int lo, int hi) async {
    final pivot = nums[hi];
    markNodeAsPivot(hi);

    int index = lo - 1;

    await pause();

    for (int i = lo; i < hi; ++i) {
      markNodeForSorting(index + 1);
      markNodeForSorting(i);
      emitState();
      await pause();

      if (nums[i].value < pivot.value) {
        index++;

        final temp = nums[i];
        nums[i] = nums[index];
        nums[index] = temp;

        markNodeAsNotSorted(index);
        emitState();
      }
      markNodeAsNotSorted(i);
      emitState();
      await pause();
    }

    index++;

    markNodeForSorting(index);
    markNodeForSorting(hi);
    emitState();
    await pause();

    nums[hi] = nums[index];
    nums[index] = pivot;

    markNodeAsNotSorted(index);
    markNodeAsNotSorted(hi);
    emitState();
    await pause();

    return index;
  }

  Future<void> qs(List<SortModel> nums, int lo, int hi) async {
    if (lo >= hi) {
      return;
    }

    final pivotIndex = await partition(nums, lo, hi);
    await qs(nums, lo, pivotIndex - 1);
    await qs(nums, pivotIndex + 1, hi);
  }

}