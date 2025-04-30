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
  return data.map((e) => Question.fromJson(e)).toList();
}

Future<List<Question>> fetchQuestionsByIds(List<int> ids) async {
  final response = await http.post(
    Uri.parse('$baseUrl/api/questions/by_ids'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'ids': ids}),
  );
  if (response.statusCode != 200) {
    throw Exception(response.body);
  }

  final data = json.decode(response.body) as List;
  return data.map((e) => Question.fromJson(e)).toList();
}
