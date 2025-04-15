import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/fetch_user_type_counts.dart';
import 'type_page_state.dart';

class TypePageCubit extends Cubit<TypePageState> {
  TypePageCubit() : super(const TypePageState());

  Future<void> loadTypeCounts(String? userId) async {
    if (userId == null) {
      emit(state.copyWith(isLoading: false, error: '로그인이 필요합니다.'));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final typeCounts = await fetchUserTypeCounts(userId);
      emit(state.copyWith(isLoading: false, typeCounts: typeCounts));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
