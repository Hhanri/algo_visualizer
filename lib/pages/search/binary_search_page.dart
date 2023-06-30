import 'package:algo_visualizer/cubits/search/binary_search_cubit.dart';
import 'package:algo_visualizer/pages/search/search_base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BinarySearchPage extends StatelessWidget {
  const BinarySearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BinarySearchCubit>(
      create: (context) => BinarySearchCubit()..init(),
      child: const SearchBasePage<BinarySearchCubit>(title: 'BinarySearch'),
    );
  }
}
