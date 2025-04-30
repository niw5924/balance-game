import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/user_play_record_model.dart';
import '../../models/category_model.dart';
import '../../models/question_model.dart';
import '../../services/fetch_questions.dart';
import '../../widgets/question_answer_card.dart';

class RecordDetailPage extends StatefulWidget {
  final UserPlayRecordModel record;

  const RecordDetailPage({super.key, required this.record});

  @override
  State<RecordDetailPage> createState() => _RecordDetailPageState();
}

class _RecordDetailPageState extends State<RecordDetailPage> {
  late Future<List<Question>> _questionsFuture;

  @override
  void initState() {
    super.initState();
    final ids = widget.record.selectedAnswersRaw
        .map((e) => int.parse(e.keys.first))
        .toList();
    _questionsFuture = fetchQuestionsByIds(ids);
  }

  @override
  Widget build(BuildContext context) {
    final category =
        categories.firstWhere((c) => c.title == widget.record.category);
    final localDate = widget.record.createdAt.toLocal();
    final dateString = DateFormat('yyyy년 M월 d일 HH:mm').format(localDate);

    return Scaffold(
      backgroundColor: category.backgroundColor,
      appBar: AppBar(
        backgroundColor: category.mainColor,
        title: Text(widget.record.category),
      ),
      body: FutureBuilder<List<Question>>(
        future: _questionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: category.mainColor));
          }

          if (snapshot.hasError) {
            return Center(child: Text('에러: ${snapshot.error}'));
          }

          final questions = snapshot.data!;
          final selectedAnswersRaw = widget.record.selectedAnswersRaw;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  Text('$dateString의 나는 이렇게 골랐어요!'),
                  const SizedBox(height: 24),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedAnswersRaw.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final entry = selectedAnswersRaw[index];
                      final questionId = int.parse(entry.keys.first);
                      final selectedIndex = entry.values.first;

                      final question =
                          questions.firstWhere((q) => q.id == questionId);

                      return QuestionAnswerCard(
                        category: category,
                        questionIndex: index,
                        question: question,
                        selectedOptionIndex: selectedIndex,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
