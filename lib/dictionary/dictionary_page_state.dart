import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_page_state.freezed.dart';

enum DictionaryViewMode {
  card,
  grid,
}

@freezed
abstract class DictionaryPageState with _$DictionaryPageState {
  const factory DictionaryPageState({
    @Default(true) bool isLoading,
    String? error,
    @Default(0) int currentIndex,
    @Default({}) Map<String, int> typeCounts,
    @Default(DictionaryViewMode.card) DictionaryViewMode viewMode,
  }) = _DictionaryPageState;
}
