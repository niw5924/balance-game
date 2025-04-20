import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = dotenv.env['BASE_URL']!;

Future<void> deleteUserData({
  required String userId,
}) async {
  final response = await http.post(
    Uri.parse('$baseUrl/api/delete_user_data'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': userId,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }
}
