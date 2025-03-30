import 'package:flutter/material.dart';
import '../balance_game/balance_game_page.dart';
import '../dictionary/dictionary_page.dart';
import '../record/record_page.dart';
import '../settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    BalanceGamePage(),
    DictionaryPage(),
    RecordPage(),
    SettingsPage(),
  ];

  final List<BottomNavigationBarItem> _bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.compare_arrows), label: '밸런스게임'),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: '도감'),
    BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '기록'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomItems,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
