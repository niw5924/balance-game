import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFF101418),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F24),
        title: const Text(
          '설정',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1F24),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: const Color(0xFF3A3F45),
                        backgroundImage: auth.isLoggedIn
                            ? NetworkImage(auth.userProfileImage!)
                            : null,
                        child: auth.isLoggedIn
                            ? null
                            : const Icon(
                                Icons.person_outline,
                                color: Colors.white,
                                size: 32,
                              ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          auth.isLoggedIn
                              ? (auth.userName ?? 'Unknown')
                              : '로그인하면 도감과 기록을 확인할 수 있어요!',
                          style: TextStyle(
                            fontSize: auth.isLoggedIn ? 20 : 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () async {
                      auth.isLoggedIn
                          ? await auth.logout()
                          : await auth.loginWithNaver();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: auth.isLoggedIn
                            ? const Color(0xFF3A3F45)
                            : const Color(0xFF03C75A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          auth.isLoggedIn
                              ? const Icon(Icons.logout, color: Colors.white)
                              : Image.asset(
                                  'assets/images/naver_icon.png',
                                  width: 36,
                                  height: 36,
                                ),
                          const SizedBox(width: 8),
                          Text(
                            auth.isLoggedIn ? '로그아웃' : '네이버 로그인',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
