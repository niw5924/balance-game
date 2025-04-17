import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/user_play_record_model.dart';

part 'record_page_state.freezed.dart';

@freezed
abstract class RecordPageState with _$RecordPageState {
  const factory RecordPageState({
    @Default(true) bool isLoading,
    String? error,
    @Default([]) List<UserPlayRecordModel> records,
  }) = _RecordPageState;
}
