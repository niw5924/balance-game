import 'package:flutter/material.dart';
import 'package:balance_game/balance_game/models/category_model.dart';

import 'balance_game_play/balance_game_play_page.dart';

class BalanceGamePage extends StatelessWidget {
  const BalanceGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101418),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F24),
        title: const Text(
          '밸런스 게임',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            const Text(
              '어떤 밸런스 게임을 해볼까요?',
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
                          builder: (_) =>
                              BalanceGamePlayPage(category: category),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            category.mainColor.withValues(alpha: 0.1),
                            category.mainColor.withValues(alpha: 0.2),
                            category.mainColor.withValues(alpha: 0.5),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(category.emoji,
                              style: const TextStyle(fontSize: 32)),
                          const SizedBox(height: 12),
                          Text(
                            category.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: category.mainColor,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            category.subtitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
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
