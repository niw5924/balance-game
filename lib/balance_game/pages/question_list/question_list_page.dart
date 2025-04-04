import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:balance_game/balance_game/models/category_model.dart';
import 'question_list_page_cubit.dart';
import 'question_list_page_state.dart';

class QuestionListPage extends StatelessWidget {
  final Category category;

  const QuestionListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuestionListPageCubit()..loadQuestions(category),
      child: _QuestionListView(),
    );
  }
}

class _QuestionListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionListPageCubit, QuestionListPageState>(
      builder: (context, state) {
        final category = state.category!;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: category.mainColor,
            title: Text(category.title),
          ),
          backgroundColor: category.backgroundColor,
          body: Builder(
            builder: (_) {
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: category.mainColor),
                );
              }

              if (state.error != null) {
                return Center(
                  child: Text(
                    '에러: ${state.error}',
                    style: TextStyle(color: category.mainColor),
                  ),
                );
              }

              if (state.questions.isEmpty) {
                return Center(
                  child: Text(
                    '문제가 없습니다.',
                    style: TextStyle(color: category.mainColor),
                  ),
                );
              }

              if (state.currentIndex >= state.questions.length) {
                return Center(
                  child: Text(
                    '더 이상 문제가 없습니다.',
                    style: TextStyle(color: category.mainColor),
                  ),
                );
              }

              final question = state.questions[state.currentIndex];
              final selected = state.selectedAnswers[state.currentIndex];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${state.currentIndex + 1} / ${state.questions.length}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: category.mainColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      question.question,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    _buildOptionButton(
                      index: 0,
                      text: question.options[0].text,
                      isSelected: selected == 0,
                      backgroundColor: category.optionAColor,
                      selectedBackgroundColor: category.mainColor,
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context.read<QuestionListPageCubit>().selectAnswer(0);
                      },
                    ),
                    const SizedBox(height: 8),
                    _buildVS(),
                    const SizedBox(height: 8),
                    _buildOptionButton(
                      index: 1,
                      text: question.options[1].text,
                      isSelected: selected == 1,
                      backgroundColor: category.optionBColor,
                      selectedBackgroundColor: category.mainColor,
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context.read<QuestionListPageCubit>().selectAnswer(1);
                      },
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state.currentIndex > 0)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: category.mainColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              context
                                  .read<QuestionListPageCubit>()
                                  .previousQuestion();
                            },
                            child: const Text('이전',
                                style: TextStyle(fontSize: 18)),
                          ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: category.mainColor,
                            foregroundColor: category.backgroundColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            if (selected == null) {
                              Flushbar(
                                message: "선택지를 골라주세요!",
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.black,
                                margin: const EdgeInsets.all(16),
                                borderRadius: BorderRadius.circular(8),
                                icon: const Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.red,
                                ),
                              ).show(context);
                              return;
                            }

                            context
                                .read<QuestionListPageCubit>()
                                .nextQuestion();
                          },
                          child:
                              const Text('다음', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildOptionButton({
    required int index,
    required String text,
    required bool isSelected,
    required Color backgroundColor,
    required Color selectedBackgroundColor,
    required VoidCallback onTap,
  }) {
    return AnimatedButton(
      height: 80,
      width: double.infinity,
      text: text,
      isSelected: isSelected,
      selectedTextColor: Colors.white,
      backgroundColor: backgroundColor,
      selectedBackgroundColor: selectedBackgroundColor,
      transitionType: TransitionType.CENTER_ROUNDER,
      textStyle: TextStyle(
        fontSize: isSelected ? 22 : 20,
        fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
        color: Colors.white,
      ),
      borderRadius: 16,
      borderWidth: isSelected ? 4 : 0,
      borderColor: isSelected ? Colors.black : Colors.transparent,
      onPress: onTap,
    );
  }

  Widget _buildVS() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: const Text(
        'VS',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
