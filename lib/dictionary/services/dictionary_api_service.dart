import 'dart:convert';
import 'package:http/http.dart' as http;

class DictionaryApiService {
  static const String baseUrl = 'http://192.168.35.85:3000';

  static Future<Map<String, int>> fetchUserTypeCounts(String userId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/user_type_counts/$userId'));

    if (response.statusCode != 200) {
      throw Exception('유저 타입 카운트 불러오기 실패: ${response.body}');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    data.remove('user_id');
    return data.map((key, value) => MapEntry(key, value as int));
  }
}
