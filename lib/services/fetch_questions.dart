import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/question_model.dart';

final String baseUrl = dotenv.env['BASE_URL']!;

/// 카테고리 기반 질문 가져오기(서버에서 랜덤 10개)
Future<List<Question>> fetchQuestionsByCategory(String category) async {
  final response =
      await http.get(Uri.parse('$baseUrl/api/questions/$category'));

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }

  final data = json.decode(response.body) as List;
  return data.map((e) => Question.fromJson(e)).toList();
}

/// 질문 ID 리스트로 질문들 가져오기
Future<List<Question>> fetchQuestionsByQuestionIds(
    List<int> questionIds) async {
  final response = await http.post(
    Uri.parse('$baseUrl/api/questions/questionIds'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'questionIds': questionIds}),
  );

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }

  final data = json.decode(response.body) as List;
  return data.map((e) => Question.fromJson(e)).toList();
}
