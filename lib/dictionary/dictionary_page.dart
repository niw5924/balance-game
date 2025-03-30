import 'package:flutter/material.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('도감')),
      body: const Center(child: Text('내가 푼 퀴즈 도감')),
    );
  }
}
