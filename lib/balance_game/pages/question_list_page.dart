import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/api_service.dart';

class QuestionListPage extends StatelessWidget {
  final String category;

  const QuestionListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$category 질문')),
      body: FutureBuilder<List<Question>>(
        future: ApiService.fetchQuestionsByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러: ${snapshot.error}'));
          }

          final questions = snapshot.data!;
          return ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final q = questions[index];
              return ListTile(
                title: Text(q.question),
                subtitle: Text(q.options.map((o) => o.text).join(' vs ')),
              );
            },
          );
        },
      ),
    );
  }
}
