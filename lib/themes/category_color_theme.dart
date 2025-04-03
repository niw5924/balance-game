import 'package:flutter/material.dart';

class CategoryColorTheme {
  final Color backgroundColor;
  final Color optionAColor;
  final Color optionBColor;

  const CategoryColorTheme({
    required this.backgroundColor,
    required this.optionAColor,
    required this.optionBColor,
  });
}

final Map<String, CategoryColorTheme> categoryColorThemes = {
  '19금': CategoryColorTheme(
    backgroundColor: Color(0xFFFFE5E5),
    optionAColor: Colors.lightBlueAccent,
    optionBColor: Colors.greenAccent,
  ),
  '혐오': CategoryColorTheme(
    backgroundColor: Color(0xFFE0F2F1),
    optionAColor: Colors.pinkAccent,
    optionBColor: Colors.deepPurple,
  ),
  '극한': CategoryColorTheme(
    backgroundColor: Color(0xFFECEFF1),
    optionAColor: Colors.orangeAccent,
    optionBColor: Colors.cyanAccent,
  ),
  '혼란': CategoryColorTheme(
    backgroundColor: Color(0xFFEDE7F6),
    optionAColor: Colors.amber,
    optionBColor: Colors.lightGreenAccent,
  ),
  '망신': CategoryColorTheme(
    backgroundColor: Color(0xFFFFF8E1),
    optionAColor: Colors.indigo,
    optionBColor: Colors.tealAccent,
  ),
};

const CategoryColorTheme defaultCategoryColorTheme = CategoryColorTheme(
  backgroundColor: Color(0xFFF5F5F5),
  optionAColor: Colors.grey,
  optionBColor: Colors.blueGrey,
);
