import 'package:flutter/material.dart';
import '../../themes/category_color_theme.dart';
import '../models/question_model.dart';
import '../services/api_service.dart';

class QuestionListPage extends StatefulWidget {
  final String category;
  final Color categoryColor;

  const QuestionListPage({
    super.key,
    required this.category,
    required this.categoryColor,
  });

  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  late final CategoryColorTheme colorTheme;

  late Future<List<Question>> _futureQuestions;
  int _currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    colorTheme =
        categoryColorThemes[widget.category] ?? defaultCategoryColorTheme;
    _futureQuestions = ApiService.fetchQuestionsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.categoryColor,
        title: Text(widget.category),
      ),
      backgroundColor: colorTheme.backgroundColor,
      body: FutureBuilder<List<Question>>(
        future: _futureQuestions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: widget.categoryColor),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '에러: ${snapshot.error}',
                style: TextStyle(color: widget.categoryColor),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                '문제가 없습니다.',
                style: TextStyle(color: widget.categoryColor),
              ),
            );
          }

          final questions = snapshot.data!;
          if (_currentQuestionIndex >= questions.length) {
            return Center(
              child: Text(
                '더 이상 문제가 없습니다.',
                style: TextStyle(color: widget.categoryColor),
              ),
            );
          }

          final question = questions[_currentQuestionIndex];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                _buildOptionCard(
                    question.options[0].text, colorTheme.optionAColor),
                const SizedBox(height: 16),
                _buildVS(),
                const SizedBox(height: 16),
                _buildOptionCard(
                    question.options[1].text, colorTheme.optionBColor),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.categoryColor,
                    foregroundColor: colorTheme.backgroundColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentQuestionIndex++;
                    });
                  },
                  child: const Text(
                    '다음',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOptionCard(String text, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
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
