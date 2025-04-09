import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:balance_game/balance_game/models/category_model.dart';
import 'balance_game_play_page_cubit.dart';
import 'balance_game_play_page_state.dart';
import 'type_chart_dialog.dart';

class BalanceGamePlayPage extends StatelessWidget {
  final Category category;

  const BalanceGamePlayPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BalanceGamePlayPageCubit()..loadQuestions(category),
      child: _BalanceGamePlayView(),
    );
  }
}

class _BalanceGamePlayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceGamePlayPageCubit, BalanceGamePlayPageState>(
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

              if (state.status == BalanceGamePlayStatus.completed) {
                final typeCountMap = <String, int>{};

                for (int i = 0; i < state.questions.length; i++) {
                  final selectedIndex = state.selectedAnswers[i]!;
                  final selectedOption =
                      state.questions[i].options[selectedIndex];
                  final type = selectedOption.type;
                  typeCountMap[type] = (typeCountMap[type] ?? 0) + 1;
                }

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.emoji_events,
                            size: 80, color: category.mainColor),
                        const SizedBox(height: 16),
                        Text(
                          '밸런스 게임 완료!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: category.mainColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) =>
                                  TypeChartDialog(typeCountMap: typeCountMap),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: category.mainColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          child: const Text('통계 보기'),
                        ),
                        const SizedBox(height: 24),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.questions.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final resultQuestion = state.questions[index];
                            final resultSelected = state.selectedAnswers[index];
                            final selectedOptionText =
                                resultQuestion.options[resultSelected!].text;

                            return Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: category.mainColor),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Q${index + 1}. ${resultQuestion.question}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    selectedOptionText,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: category.mainColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }

              final currentQuestion = state.questions[state.currentIndex];
              final currentSelected = state.selectedAnswers[state.currentIndex];

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
                      currentQuestion.question,
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
                      text: currentQuestion.options[0].text,
                      isSelected: currentSelected == 0,
                      backgroundColor: category.optionAColor,
                      selectedBackgroundColor: category.mainColor,
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context
                            .read<BalanceGamePlayPageCubit>()
                            .selectAnswer(0);
                      },
                    ),
                    const SizedBox(height: 8),
                    _buildVS(),
                    const SizedBox(height: 8),
                    _buildOptionButton(
                      index: 1,
                      text: currentQuestion.options[1].text,
                      isSelected: currentSelected == 1,
                      backgroundColor: category.optionBColor,
                      selectedBackgroundColor: category.mainColor,
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context
                            .read<BalanceGamePlayPageCubit>()
                            .selectAnswer(1);
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
                                  .read<BalanceGamePlayPageCubit>()
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
                            if (currentSelected == null) {
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
                                .read<BalanceGamePlayPageCubit>()
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
