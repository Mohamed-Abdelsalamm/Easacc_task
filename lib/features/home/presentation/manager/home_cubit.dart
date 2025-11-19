import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easacc_flutter_task/core/prefs/app_preferences.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> loadLink() async {
    emit(HomeLoading());
    try {
      final link = AppPreference.getHomeLink();
      if (link == null || link.isEmpty) {
        emit(HomeNoLink());
      } else {
        emit(HomeLoaded(link: link, isPageLoading: true));
      }
    } catch (e) {
      emit(HomeError('Failed to load link'));
    }
  }

  void setPageLoading(bool isLoading) {
    final current = state;
    if (current is HomeLoaded) {
      emit(HomeLoaded(link: current.link, isPageLoading: isLoading));
    }
  }

  Future<void> refresh() async {
    await loadLink();
  }
}
