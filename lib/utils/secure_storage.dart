import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage(iOptions: IOSOptions(accessibility: KeychainAccessibility.unlocked), aOptions: AndroidOptions(encryptedSharedPreferences: true));

  static Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> add(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<void> delete(String key) async {
    await _storage.delete(key: key);

  }
}