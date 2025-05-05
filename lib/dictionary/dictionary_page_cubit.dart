import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/fetch_user_type_counts.dart';
import 'dictionary_page_state.dart';

class DictionaryPageCubit extends Cubit<DictionaryPageState> {
  DictionaryPageCubit() : super(const DictionaryPageState());

  Future<void> loadTypeCounts(String? userId) async {
    if (userId == null) {
      emit(state.copyWith(isLoading: false, error: '로그인이 필요합니다.'));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));
    try {
      final counts = await fetchUserTypeCounts(userId);
      emit(state.copyWith(isLoading: false, typeCounts: counts));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void toggleViewMode() {
    final newMode = state.viewMode == DictionaryViewMode.card
        ? DictionaryViewMode.grid
        : DictionaryViewMode.card;

    emit(state.copyWith(viewMode: newMode));
  }

  void updateIndex(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}
