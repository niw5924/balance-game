import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/question_model.dart';

final String baseUrl = dotenv.env['BASE_URL']!;

Future<List<Question>> fetchQuestionsByCategory(String category) async {
  final response =
      await http.get(Uri.parse('$baseUrl/api/questions/$category'));

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }

  final data = json.decode(response.body) as List;

  return data.map((json) => Question.fromJson(json)).toList();
}
