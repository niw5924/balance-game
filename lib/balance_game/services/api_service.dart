import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_model.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.35.85:3000';

  static Future<List<Question>> fetchQuestionsByCategory(
      String category) async {
    final response = await http.get(Uri.parse('$baseUrl/api/questions'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;

      final List<Question> questions = data
          .map((json) => Question.fromJson(json))
          .where((q) => q.category == category)
          .toList();

      questions.shuffle();

      return questions;
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
