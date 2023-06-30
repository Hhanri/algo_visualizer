import 'package:algo_visualizer/cubits/search/base_search_cubit.dart';
import 'package:algo_visualizer/models/search_model.dart';

class LinearSearchCubit extends BaseSearchCubit {

  @override
  void search({int value = 34}) {
    super.search(value: value);
    _startSearch(numbers, value);
  }

  Future _startSearch(List<SearchModel> list, int target) async {
    for (var index = 0; index < list.length; index++) {
      potentialNode(index);
      await pause();
      if (numbers[index].value == target) {
        foundNode(index);
        return;
      } else {
        discardNode(index);
      }
    }
    nodeNotFound();
  }
}