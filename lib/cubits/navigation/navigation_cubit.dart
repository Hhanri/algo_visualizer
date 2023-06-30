import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.linearSearch);
  final PageController pageController = PageController();

  void changeView(NavigationState newState) {
    pageController.jumpToPage(newState.index);
    emit(newState);
  }

  void reset() {
    changeView(NavigationState.linearSearch);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}


enum NavigationState {
  linearSearch,
  binarySearch
}