import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:collection/collection.dart';
import 'auth_provider.dart';

class StorageHelper {
  static final _storage = FlutterSecureStorage();

  static String _tokenKey(SocialLoginMethod method) {
    switch (method) {
      case SocialLoginMethod.naver:
        return 'token_naver';
      case SocialLoginMethod.google:
        return 'token_google';
      case SocialLoginMethod.kakao:
        return 'token_kakao';
    }
  }

  static const _keySavedLoginMethod = 'saved_login_method';

  static Future<void> saveToken(SocialLoginMethod method, String token) async {
    await _storage.write(key: _tokenKey(method), value: token);
  }

  static Future<String?> loadToken(SocialLoginMethod method) async {
    return await _storage.read(key: _tokenKey(method));
  }

  static Future<void> clearToken(SocialLoginMethod method) async {
    await _storage.delete(key: _tokenKey(method));
  }

  static Future<void> saveLoginMethod(SocialLoginMethod method) async {
    await _storage.write(key: _keySavedLoginMethod, value: method.name);
  }

  static Future<SocialLoginMethod?> loadSavedLoginMethod() async {
    final value = await _storage.read(key: _keySavedLoginMethod);
    return SocialLoginMethod.values
        .firstWhereOrNull((method) => method.name == value);
  }

  static Future<void> clearSavedLoginMethod() async {
    await _storage.delete(key: _keySavedLoginMethod);
  }
}
