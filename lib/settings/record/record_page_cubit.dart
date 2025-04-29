import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/fetch_user_play_records.dart';
import 'record_page_state.dart';

class RecordPageCubit extends Cubit<RecordPageState> {
  RecordPageCubit() : super(const RecordPageState());

  Future<void> loadRecords(String userId) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final records = await fetchUserPlayRecords(userId);
      emit(state.copyWith(isLoading: false, records: records));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
