import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';
import '../services/delete_user_data.dart';
import '../widgets/shake_widget.dart';
import 'record/record_page.dart';
import '../widgets/custom_dialog.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GlobalKey<ShakeWidgetState> historyShakeKey =
      GlobalKey<ShakeWidgetState>();
  final GlobalKey<ShakeWidgetState> recordsShakeKey =
      GlobalKey<ShakeWidgetState>();

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
                      if (auth.isLoggedIn) {
                        final shouldLogout = await showCustomDialog(
                          context: context,
                          title: '로그아웃',
                          content: '로그아웃하시겠어요?',
                          cancelText: '취소',
                          confirmText: '확인',
                        );
                        if (shouldLogout == true) {
                          await auth.logout();
                          Flushbar(
                            message: "로그아웃 되었습니다.",
                            duration: const Duration(seconds: 2),
                            backgroundColor: Colors.green,
                            margin: const EdgeInsets.all(16),
                            borderRadius: BorderRadius.circular(8),
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                          ).show(context);
                        }
                      } else {
                        await auth.loginWithNaver();
                        if (auth.isLoggedIn) {
                          Flushbar(
                            message: "${auth.userName}님 환영합니다!",
                            duration: const Duration(seconds: 2),
                            backgroundColor: Colors.green,
                            margin: const EdgeInsets.all(16),
                            borderRadius: BorderRadius.circular(8),
                            icon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ).show(context);
                        }
                      }
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
            const SizedBox(height: 16),
            ShakeWidget(
              key: historyShakeKey,
              child: Material(
                color: const Color(0xFF1A1F24),
                borderRadius: BorderRadius.circular(16),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  leading: const Icon(Icons.history, color: Colors.white),
                  title: const Text(
                    '나의 선택 히스토리',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: const Text(
                    '내가 어떤 선택을 해왔는지 볼 수 있어요',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: Colors.grey, size: 16),
                  onTap: () {
                    if (!auth.isLoggedIn) {
                      historyShakeKey.currentState?.shake();
                      Flushbar(
                        message: "히스토리를 보려면 로그인이 필요해요!",
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.red,
                        margin: const EdgeInsets.all(16),
                        borderRadius: BorderRadius.circular(8),
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                      ).show(context);
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RecordPage()),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            ShakeWidget(
              key: recordsShakeKey,
              child: Material(
                color: const Color(0xFF1A1F24),
                borderRadius: BorderRadius.circular(16),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  leading:
                      const Icon(Icons.delete_forever, color: Colors.white),
                  title: const Text(
                    '나의 모든 기록 삭제하기',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: const Text(
                    '과거는 뒤로, 새로운 내가 되고 싶다면',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: Colors.grey, size: 16),
                  onTap: () async {
                    if (!auth.isLoggedIn) {
                      recordsShakeKey.currentState?.shake();
                      Flushbar(
                        message: "기록을 삭제하려면 로그인이 필요해요!",
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.red,
                        margin: const EdgeInsets.all(16),
                        borderRadius: BorderRadius.circular(8),
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                      ).show(context);
                      return;
                    }

                    final shouldDelete = await showCustomDialog(
                      context: context,
                      title: '기록 삭제',
                      content: '내가 저장한 선택과 성향들이 모두 지워져요.\n정말 삭제할까요?',
                      cancelText: '취소',
                      confirmText: '삭제',
                    );

                    if (shouldDelete == true) {
                      try {
                        await deleteUserData(userId: auth.userId!);

                        Flushbar(
                          message: "기록이 삭제되었습니다.",
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          margin: const EdgeInsets.all(16),
                          borderRadius: BorderRadius.circular(8),
                          icon: const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                        ).show(context);
                      } catch (e) {
                        Flushbar(
                          message: "삭제에 실패했어요. 다시 시도해주세요.",
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.red,
                          margin: const EdgeInsets.all(16),
                          borderRadius: BorderRadius.circular(8),
                          icon: const Icon(
                            Icons.error_outline,
                            color: Colors.white,
                          ),
                        ).show(context);
                      }
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Ver 1.2.4',
                  style: TextStyle(color: Colors.grey),
                ),
                if (auth.isLoggedIn) ...[
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () async {
                      final shouldWithdraw = await showCustomDialog(
                        context: context,
                        title: '회원 탈퇴',
                        content: '정말 탈퇴하시겠어요?\n모든 데이터가 삭제돼요.',
                        cancelText: '취소',
                        confirmText: '탈퇴',
                      );
                      if (shouldWithdraw == true) {
                        await auth.withdraw();

                        Flushbar(
                          message: "회원 탈퇴가 완료되었습니다.",
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          margin: const EdgeInsets.all(16),
                          borderRadius: BorderRadius.circular(8),
                          icon: const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                        ).show(context);
                      }
                    },
                    child: const Text(
                      '탈퇴하기',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
