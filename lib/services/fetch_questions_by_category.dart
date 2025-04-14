import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../balance_game/models/question_model.dart';

final String baseUrl = dotenv.env['BASE_URL']!;

Future<List<Question>> fetchQuestionsByCategory(String category) async {
  final response = await http.get(Uri.parse('$baseUrl/api/questions'));

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }

  final data = json.decode(response.body) as List;

  final List<Question> questions = data
      .map((json) => Question.fromJson(json))
      .where((q) => q.category == category)
      .toList();

  questions.shuffle();
  return questions;
}
