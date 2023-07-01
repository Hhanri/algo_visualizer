import 'package:algo_visualizer/pages/search/binary_search_page.dart';
import 'package:algo_visualizer/pages/search/linear_search_page.dart';
import 'package:algo_visualizer/pages/sort/bubble_sort_page.dart';
import 'package:algo_visualizer/pages/sort/insertion_sort_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algo Visualizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        InsertionSortPage(),
        BubbleSortPage(),
        LinearSearchPage(),
        BinarySearchPage()
      ],
    );
  }
}
