import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_naver_login/interface/types/naver_login_status.dart';
import '../services/delete_user_data.dart';
import 'storage_helper.dart';

enum SocialLoginMethod { naver, google, kakao }

class AuthProvider extends ChangeNotifier {
  String? userId;
  String? userName;
  String? userProfileImage;
  SocialLoginMethod? currentLoginMethod;

  bool get isLoggedIn =>
      userId != null && userName != null && userProfileImage != null;

  void _setUser({
    required String id,
    required String name,
    required String profileImage,
  }) {
    userId = id;
    userName = name;
    userProfileImage = profileImage;
    debugPrint('로그인 완료');
    debugPrint('ID: $userId');
    debugPrint('이름: $userName');
    debugPrint('프로필: $userProfileImage');
    notifyListeners();
  }

  void _clearUser() {
    userId = null;
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
          final naverToken = await FlutterNaverLogin.getCurrentAccessToken();
          debugPrint(naverToken.accessToken);
          if (naverToken.accessToken.isNotEmpty) {
            final account = await FlutterNaverLogin.getCurrentAccount();
            if (account.id == null ||
                account.name == null ||
                account.profileImage == null) {
              return;
            }

            _setUser(
              id: account.id!,
              name: account.name!,
              profileImage: account.profileImage!,
            );
            currentLoginMethod = savedLoginMethod;
          } else {
            debugPrint('accessToken이 비어 있음. 만료되었거나 무효한 토큰');
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
    if (result.status != NaverLoginStatus.loggedIn || result.account == null) {
      return;
    }

    final token = await FlutterNaverLogin.getCurrentAccessToken();
    await StorageHelper.saveToken(SocialLoginMethod.naver, token.accessToken);
    await StorageHelper.saveLoginMethod(SocialLoginMethod.naver);

    final account = result.account!;
    _setUser(
      id: account.id!,
      name: account.name!,
      profileImage: account.profileImage!,
    );
    currentLoginMethod = SocialLoginMethod.naver;
  }

  Future<void> logout() async {
    switch (currentLoginMethod) {
      case SocialLoginMethod.naver:
        await FlutterNaverLogin.logOut();
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

  Future<void> withdraw() async {
    await deleteUserData(userId: userId!);

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
