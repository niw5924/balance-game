import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_page_state.freezed.dart';

@freezed
abstract class TypePageState with _$TypePageState {
  const factory TypePageState({
    @Default(true) bool isLoading,
    String? error,
    @Default({}) Map<String, int> typeCounts,
  }) = _TypePageState;
}
