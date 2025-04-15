import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_page_state.freezed.dart';

@freezed
abstract class DictionaryPageState with _$DictionaryPageState {
  const factory DictionaryPageState({
    @Default(true) bool isLoading,
    String? error,
    @Default(0) int currentIndex,
    @Default({}) Map<String, int> typeCounts,
  }) = _DictionaryPageState;
}
