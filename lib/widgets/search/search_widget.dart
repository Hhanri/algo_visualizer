import 'package:algo_visualizer/cubits/search/base_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget<T extends BaseSearchCubit> extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget<T>> createState() => _SearchWidgetState<T>();
}

class _SearchWidgetState<T extends BaseSearchCubit> extends State<SearchWidget<T>> {

  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _search() {
    try {
      final val = int.parse(textEditingController.text);
      context.read<T>().search(value: val);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: 'Value',
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          keyboardType: TextInputType.number,
        ),
        BlocSelector<T, SearchCubitState, bool>(
          selector: (state) => state.isSearching,
          builder: (context, isSearching) {
            return ElevatedButton(
              onPressed: isSearching ? null : _search,
              child: const Text("Search")
            );
          }
        )
      ],
    );
  }
}
