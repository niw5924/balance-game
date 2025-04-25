import '../models/category_model.dart';
import '../models/question_model.dart';

String buildResultShareText({
  required Category category,
  required List<Question> questions,
  required Map<int, int> selectedAnswers,
}) {
  final buffer = StringBuffer();

  buffer.writeln('${category.emoji} [${category.title}] 밸런스 게임 결과\n');

  for (int i = 0; i < questions.length; i++) {
    final question = questions[i];
    final selectedIndex = selectedAnswers[i];
    if (selectedIndex == null) continue;

    final options = question.options;

    buffer.writeln('Q${i + 1}. ${question.question}');
    for (int j = 0; j < options.length; j++) {
      final label = j == 0 ? 'A.' : 'B.';
      final check = j == selectedIndex ? ' ✅' : '';
      buffer.writeln('$label ${options[j].text}$check');
    }
    buffer.writeln('');
  }

  buffer.writeln(
      '너도 해볼래? 👉 https://play.google.com/store/apps/details?id=com.niw.balance_game');

  return buffer.toString();
}
