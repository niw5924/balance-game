import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'storage_helper.dart';

enum SocialLoginMethod { naver, google, kakao }

class AuthProvider extends ChangeNotifier {
  String? userName;
  String? userProfileImage;
  SocialLoginMethod? currentLoginMethod;

  bool get isLoggedIn => userName != null && userProfileImage != null;

  void _setUser({required String name, required String profileImage}) {
    userName = name;
    userProfileImage = profileImage;
    debugPrint('로그인 완료');
    debugPrint('이름: $userName');
    debugPrint('프로필: $userProfileImage');
    notifyListeners();
  }

  void _clearUser() {
    userName = null;
    userProfileImage = null;
    currentLoginMethod = null;
    debugPrint('로그아웃 완료');
    debugPrint('이름: $userName');
    debugPrint('프로필: $userProfileImage');
    notifyListeners();
  }

  Future<void> checkAutoLogin() async {
    try {
      final savedLoginMethod = await StorageHelper.loadSavedLoginMethod();
      debugPrint('저장된 로그인 방식: $savedLoginMethod');
      if (savedLoginMethod == null) return;

      final token = await StorageHelper.loadToken(savedLoginMethod);
      debugPrint('불러온 토큰: $token');
      if (token == null || token.isEmpty) return;

      switch (savedLoginMethod) {
        case SocialLoginMethod.naver:
          final naverToken = await FlutterNaverLogin.currentAccessToken;
          if (naverToken.accessToken.isNotEmpty) {
            final account = await FlutterNaverLogin.currentAccount();
            _setUser(name: account.name, profileImage: account.profileImage);
            currentLoginMethod = savedLoginMethod;
          }
          break;

        case SocialLoginMethod.google:
          break;

        case SocialLoginMethod.kakao:
          break;
      }
    } catch (e) {
      debugPrint('자동 로그인 실패: $e');
    }
  }

  Future<void> loginWithNaver() async {
    final result = await FlutterNaverLogin.logIn();
    if (result.status == NaverLoginStatus.loggedIn) {
      final token = await FlutterNaverLogin.currentAccessToken;
      await StorageHelper.saveToken(SocialLoginMethod.naver, token.accessToken);
      await StorageHelper.saveLoginMethod(SocialLoginMethod.naver);
      final account = result.account;
      _setUser(name: account.name, profileImage: account.profileImage);
      currentLoginMethod = SocialLoginMethod.naver;
    }
  }

  Future<void> logout() async {
    switch (currentLoginMethod) {
      case SocialLoginMethod.naver:
        await FlutterNaverLogin.logOutAndDeleteToken();
        await StorageHelper.clearToken(SocialLoginMethod.naver);
        break;

      case SocialLoginMethod.google:
        break;

      case SocialLoginMethod.kakao:
        break;

      case null:
        break;
    }

    await StorageHelper.clearSavedLoginMethod();
    _clearUser();
  }
}
