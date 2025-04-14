import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = dotenv.env['BASE_URL']!;

Future<Map<String, int>> fetchUserTypeCounts(String userId) async {
  final response =
      await http.get(Uri.parse('$baseUrl/api/user_type_counts/$userId'));

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }

  final data = json.decode(response.body) as Map<String, dynamic>;
  data.remove('user_id');
  return data.map((key, value) => MapEntry(key, value as int));
}
