import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation_states.dart';


class NavProvider extends StateNotifier<NavStates> {
  NavProvider() : super(const NavStates());

  void updateIndex(int index) {
    state = state.copyWith(index: index, isLoading: true);
    Future.delayed(const Duration(seconds: 1))
        .then((value) => state = state.copyWith(isLoading: false));
  }
}

final navProvider = StateNotifierProvider<NavProvider, NavStates>((ref) {
  return NavProvider();
});