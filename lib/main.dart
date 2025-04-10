import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'auth/auth_provider.dart';
import 'home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const BalanceGameRoot());
}

class BalanceGameRoot extends StatelessWidget {
  const BalanceGameRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider()..checkAutoLogin(),
      lazy: false,
      child: const BalanceGameApp(),
    );
  }
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
