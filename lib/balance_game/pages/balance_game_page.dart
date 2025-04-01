import 'package:balance_game/balance_game/pages/question_list_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_gradient/animated_gradient.dart';

class BalanceGamePage extends StatelessWidget {
  const BalanceGamePage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      "emoji": "🔥",
      "title": "19금",
      "subtitle": "상상 그 이상일지도",
      "color": Colors.redAccent
    },
    {"emoji": "🤢", "title": "혐오", "subtitle": "불쾌 주의", "color": Colors.teal},
    {
      "emoji": "🧊",
      "title": "극한",
      "subtitle": "멘탈 테스트",
      "color": Colors.blueGrey
    },
    {
      "emoji": "🤯",
      "title": "혼란",
      "subtitle": "이게 맞아?",
      "color": Colors.deepPurple
    },
    {"emoji": "😳", "title": "망신", "subtitle": "쪽팔림 주의", "color": Colors.amber},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101418),
      appBar: AppBar(title: const Text('밸런스게임')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            const Text(
              '어떤 밸런스게임을 해볼까요?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuestionListPage(
                            category: category['title'],
                            categoryColor: category['color'],
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AnimatedGradient(
                        colors: [
                          category['color'].withOpacity(0.05),
                          Colors.lightBlue,
                          Colors.black,
                        ],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(category['emoji'],
                                style: const TextStyle(fontSize: 32)),
                            const SizedBox(height: 12),
                            Text(
                              category['title'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: category['color'],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              category['subtitle'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
