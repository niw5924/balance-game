import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_page_state.freezed.dart';

@freezed
abstract class DictionaryPageState with _$DictionaryPageState {
  const factory DictionaryPageState({
    @Default(0) int currentIndex,
  }) = _DictionaryPageState;
}
