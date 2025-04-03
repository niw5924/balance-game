import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:balance_game/balance_game/models/question_model.dart';
import 'package:balance_game/balance_game/models/category_model.dart';

part 'question_list_page_state.freezed.dart';

@freezed
abstract class QuestionListPageState with _$QuestionListPageState {
  const factory QuestionListPageState({
    @Default(true) bool isLoading,
    String? error,
    Category? category,
    @Default([]) List<Question> questions,
    @Default(0) int currentIndex,
    @Default({}) Map<int, int> selectedAnswers,
  }) = _QuestionListPageState;
}
