import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/user_play_record_model.dart';

final String baseUrl = dotenv.env['BASE_URL']!;

Future<List<UserPlayRecordModel>> fetchUserPlayRecords(String userId) async {
  final response =
      await http.get(Uri.parse('$baseUrl/api/user_play_records/$userId'));

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }

  final data = json.decode(response.body) as List;

  return data.map((json) => UserPlayRecordModel.fromJson(json)).toList();
}
