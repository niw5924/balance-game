import 'package:flutter/material.dart';

class BalanceGamePage extends StatelessWidget {
  const BalanceGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('밸런스게임')),
      body: const Center(child: Text('밸런스 게임 플레이 화면')),
    );
  }
}
