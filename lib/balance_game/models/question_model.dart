class Option {
  final String text;
  final String type;

  Option({
    required this.text,
    required this.type,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      text: json['text'],
      type: json['type'],
    );
  }
}

class Question {
  final String category;
  final String question;
  final List<Option> options;

  Question({
    required this.category,
    required this.question,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    final options =
        (json['options'] as List).map((e) => Option.fromJson(e)).toList();

    return Question(
      category: json['category'],
      question: json['question'],
      options: options,
    );
  }
}
