import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_model.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.35.119:3000';

  static Future<List<Question>> fetchQuestionsByCategory(
      String category) async {
    final response = await http.get(Uri.parse('$baseUrl/api/questions'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load questions: ${response.body}');
    }

    final data = json.decode(response.body) as List;

    final List<Question> questions = data
        .map((json) => Question.fromJson(json))
        .where((q) => q.category == category)
        .toList();

    questions.shuffle();

    return questions;
  }

  static Future<void> submitPlayResult({
    required String userId,
    required String category,
    required Map<String, int> selectedAnswers,
    required Map<String, int> typeCounts,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/submit_play_result'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_id': userId,
        'category': category,
        'selected_answers': selectedAnswers,
        'type_counts': typeCounts,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
  }
}
