import 'package:algo_visualizer/cubits/search/base_search_cubit.dart';
import 'package:algo_visualizer/models/search_model.dart';

class BinarySearchCubit extends BaseSearchCubit {

  @override
  void search({int value = 34}) {
    super.search(value: value);
    _startBinarySearch(numbers, value);
  }

  Future<int?> _startBinarySearch(List<SearchModel> list, int target) async {
    return _binarySearchHelper(list, target, 0, list.length - 1);
  }

  Future<int?> _binarySearchHelper(
    List<SearchModel> list,
    int target,
    int left,
    int right
  ) async {

    while (left <= right) {

      final middle = (left + right) ~/ 2;
      potentialNode(middle);

      if (list[middle].value == target) {

        foundNode(middle);
        return middle;

      } else if (list[middle].value > target) {

        discardNodes(middle + 1, right);
        await pause();
        right = middle - 1;

      } else if (list[middle].value < target) {

        discardNodes(left, middle - 1);
        await pause();
        left = middle + 1;

      }
      searchedNode(middle);
    }
    nodeNotFound();
    return null;
  }
}