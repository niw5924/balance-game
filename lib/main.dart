import 'package:flutter/material.dart';
import 'home/home_page.dart';

void main() {
  runApp(const BalanceGameApp());
}

class BalanceGameApp extends StatelessWidget {
  const BalanceGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balance Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
