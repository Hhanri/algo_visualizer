import 'package:algo_visualizer/cubits/search/linear_search_cubit.dart';
import 'package:algo_visualizer/pages/search/search_base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LinearSearchPage extends StatelessWidget {
  const LinearSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LinearSearchCubit>(
      create: (context) => LinearSearchCubit()..init(),
      child: const SearchBasePage<LinearSearchCubit>(title: 'LinearSearch'),
    );
  }
}
