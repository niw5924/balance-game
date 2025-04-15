import 'package:flutter/material.dart';
import '../balance_game/balance_game_page.dart';
import '../dictionary/dictionary_page.dart';
import '../type/type_page.dart';
import '../settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const BalanceGamePage(),
    DictionaryPage(),
    const TypePage(),
    const SettingsPage(),
  ];

  final List<BottomNavigationBarItem> _bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.question_mark), label: '밸런스 게임'),
    BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: '도감'),
    BottomNavigationBarItem(icon: Icon(Icons.person_search), label: '성향'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomItems,
        backgroundColor: const Color(0xFF1A1F24),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
