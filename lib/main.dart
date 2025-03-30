import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        textTheme: GoogleFonts.doHyeonTextTheme(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
