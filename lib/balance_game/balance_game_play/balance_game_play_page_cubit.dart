import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:balance_game/models/category_model.dart';
import '../../services/fetch_questions.dart';
import 'balance_game_play_page_state.dart';

class BalanceGamePlayPageCubit extends Cubit<BalanceGamePlayPageState> {
  BalanceGamePlayPageCubit() : super(const BalanceGamePlayPageState());

  Future<void> loadQuestions(Category category) async {
    emit(state.copyWith(isLoading: true, error: null, category: category));
    try {
      final questions = await fetchQuestionsByCategory(category.title);
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
    final questionId = state.questions[state.currentIndex].id;
    final currentSelected = state.selectedAnswers[questionId];

    final updated = Map<int, int>.from(state.selectedAnswers);
    if (currentSelected == optionIndex) {
      updated.remove(questionId);
    } else {
      updated[questionId] = optionIndex;
    }

    emit(state.copyWith(selectedAnswers: updated));
  }

  void nextQuestion() {
    final isLast = state.currentIndex == state.questions.length - 1;
    if (isLast) {
      emit(state.copyWith(status: BalanceGamePlayStatus.completed));
    } else {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    }
  }

  void previousQuestion() {
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
    }
  }
}
