class UserPlayRecordModel {
  final int id;
  final String category;
  final Map<String, int> selectedAnswers;
  final DateTime createdAt;

  UserPlayRecordModel({
    required this.id,
    required this.category,
    required this.selectedAnswers,
    required this.createdAt,
  });

  factory UserPlayRecordModel.fromJson(Map<String, dynamic> json) {
    return UserPlayRecordModel(
      id: json['id'],
      category: json['category'],
      selectedAnswers: Map<String, int>.from(json['selected_answers']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
