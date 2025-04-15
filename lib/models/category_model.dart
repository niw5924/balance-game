import 'package:flutter/material.dart';

class Category {
  final String emoji;
  final String title;
  final String subtitle;
  final Color mainColor;
  final Color backgroundColor;
  final Color optionAColor;
  final Color optionBColor;

  const Category({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.mainColor,
    required this.backgroundColor,
    required this.optionAColor,
    required this.optionBColor,
  });
}

const List<Category> categories = [
  Category(
    emoji: '🔥',
    title: '19금',
    subtitle: '상상 그 이상일지도',
    mainColor: Colors.redAccent,
    backgroundColor: Color(0xFFFFE5E5),
    optionAColor: Colors.lightBlueAccent,
    optionBColor: Colors.greenAccent,
  ),
  Category(
    emoji: '🤢',
    title: '혐오',
    subtitle: '불쾌 주의',
    mainColor: Colors.teal,
    backgroundColor: Color(0xFFE0F2F1),
    optionAColor: Colors.pinkAccent,
    optionBColor: Colors.deepPurple,
  ),
  Category(
    emoji: '🧊',
    title: '극한',
    subtitle: '멘탈 테스트',
    mainColor: Colors.blueGrey,
    backgroundColor: Color(0xFFECEFF1),
    optionAColor: Colors.orangeAccent,
    optionBColor: Colors.cyanAccent,
  ),
  Category(
    emoji: '🤯',
    title: '혼란',
    subtitle: '이게 맞아?',
    mainColor: Colors.deepPurple,
    backgroundColor: Color(0xFFEDE7F6),
    optionAColor: Colors.amber,
    optionBColor: Colors.lightGreenAccent,
  ),
  Category(
    emoji: '😳',
    title: '망신',
    subtitle: '쪽팔림 주의',
    mainColor: Colors.amber,
    backgroundColor: Color(0xFFFFF8E1),
    optionAColor: Colors.indigo,
    optionBColor: Colors.tealAccent,
  ),
];
