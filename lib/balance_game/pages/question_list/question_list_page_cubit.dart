import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:balance_game/balance_game/services/api_service.dart';
import 'package:balance_game/balance_game/models/category_model.dart';
import 'question_list_page_state.dart';

class QuestionListPageCubit extends Cubit<QuestionListPageState> {
  QuestionListPageCubit() : super(const QuestionListPageState());

  Future<void> loadQuestions(Category category) async {
    emit(state.copyWith(isLoading: true, error: null, category: category));
    try {
      final questions =
          await ApiService.fetchQuestionsByCategory(category.title);
      emit(state.copyWith(
        isLoading: false,
        questions: questions,
        currentIndex: 0,
        selectedAnswers: {},
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  void selectAnswer(int optionIndex) {
    final currentIndex = state.currentIndex;
    final currentSelected = state.selectedAnswers[currentIndex];

    final updated = Map<int, int>.from(state.selectedAnswers);
    if (currentSelected == optionIndex) {
      updated.remove(currentIndex);
    } else {
      updated[currentIndex] = optionIndex;
    }

    emit(state.copyWith(selectedAnswers: updated));
  }

  void nextQuestion() {
    if (state.currentIndex < state.questions.length) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    }
  }

  void previousQuestion() {
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
    }
  }
}
