import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:balance_game/dictionary/services/dictionary_api_service.dart';
import 'dictionary_page_state.dart';

class DictionaryPageCubit extends Cubit<DictionaryPageState> {
  DictionaryPageCubit() : super(const DictionaryPageState());

  Future<void> loadTypeCounts(String? userId) async {
    if (userId == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));
    try {
      final counts = await DictionaryApiService.fetchUserTypeCounts(userId);
      emit(state.copyWith(isLoading: false, typeCounts: counts));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void updateIndex(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}
