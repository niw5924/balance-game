import 'package:flutter/material.dart';
import '../../models/question_model.dart';
import '../../models/category_model.dart';

class QuestionAnswerCard extends StatelessWidget {
  final Category category;
  final int questionIndex;
  final Question question;
  final int selectedOptionIndex;

  const QuestionAnswerCard({
    super.key,
    required this.category,
    required this.questionIndex,
    required this.question,
    required this.selectedOptionIndex,
  });

  @override
  Widget build(BuildContext context) {
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
            'Q${questionIndex + 1}. ${question.question}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          ...List.generate(question.options.length, (i) {
            final option = question.options[i];
            final isSelected = i == selectedOptionIndex;

            return Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? category.mainColor.withValues(alpha: 0.1)
                    : null,
                border: Border.all(
                  color: isSelected ? category.mainColor : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  if (isSelected)
                    Icon(Icons.check_circle,
                        color: category.mainColor, size: 20)
                  else
                    Icon(Icons.radio_button_unchecked,
                        color: Colors.grey.shade400, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    option.text,
                    style: TextStyle(
                      fontSize: 15,
                      color: isSelected ? category.mainColor : Colors.black,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
