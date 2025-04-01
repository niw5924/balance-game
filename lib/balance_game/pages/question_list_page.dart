import 'package:flutter/material.dart';
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
  late final Color backgroundColor;
  late final Color optionAColor;
  late final Color optionBColor;

  late Future<List<Question>> _futureQuestions;
  int _currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _setColors();
    _futureQuestions = ApiService.fetchQuestionsByCategory(widget.category);
  }

  void _setColors() {
    switch (widget.category) {
      case '19금':
        backgroundColor = const Color(0xFFFFE5E5);
        optionAColor = Colors.lightBlueAccent;
        optionBColor = Colors.greenAccent;
        break;
      case '혐오':
        backgroundColor = const Color(0xFFE0F2F1);
        optionAColor = Colors.pinkAccent;
        optionBColor = Colors.deepPurple;
        break;
      case '극한':
        backgroundColor = const Color(0xFFECEFF1);
        optionAColor = Colors.orangeAccent;
        optionBColor = Colors.cyanAccent;
        break;
      case '혼란':
        backgroundColor = const Color(0xFFEDE7F6);
        optionAColor = Colors.amber;
        optionBColor = Colors.lightGreenAccent;
        break;
      case '망신':
        backgroundColor = const Color(0xFFFFF8E1);
        optionAColor = Colors.indigo;
        optionBColor = Colors.tealAccent;
        break;
      default:
        backgroundColor = Colors.grey.shade200;
        optionAColor = Colors.grey;
        optionBColor = Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.categoryColor,
        title: Text(widget.category),
      ),
      backgroundColor: backgroundColor,
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
                _buildOptionCard(question.options[0].text, optionAColor),
                const SizedBox(height: 16),
                _buildVS(),
                const SizedBox(height: 16),
                _buildOptionCard(question.options[1].text, optionBColor),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.categoryColor,
                    foregroundColor: backgroundColor,
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
      decoration: BoxDecoration(
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
