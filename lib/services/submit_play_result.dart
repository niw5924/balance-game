import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = dotenv.env['BASE_URL']!;

Future<void> submitPlayResult({
  required String userId,
  required String category,
  required List<Map<String, int>> selectedAnswers,
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
