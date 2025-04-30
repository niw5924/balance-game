class UserPlayRecordModel {
  final int id;
  final String category;
  final List<Map<String, int>> selectedAnswersRaw;
  final DateTime createdAt;

  UserPlayRecordModel({
    required this.id,
    required this.category,
    required this.selectedAnswersRaw,
    required this.createdAt,
  });

  Map<String, int> get selectedAnswersMap =>
      {for (final e in selectedAnswersRaw) ...e};

  factory UserPlayRecordModel.fromJson(Map<String, dynamic> json) {
    return UserPlayRecordModel(
      id: json['id'],
      category: json['category'],
      selectedAnswersRaw: List<Map<String, int>>.from(
        json['selected_answers'].map((e) => Map<String, int>.from(e)),
      ),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
