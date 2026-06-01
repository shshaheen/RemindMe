import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage;

  const SecureStorageService(this._secureStorage);

  /// Standard keys used across the secure storage layer
  static const String _keyPasswordHash = 'user_password_hash';

  /// Save the user's login password/pin hash securely
  Future<void> savePassword(String password) async {
    await _secureStorage.write(key: _keyPasswordHash, value: password);
  }

  /// Retrieve the user's login password/pin hash
  Future<String?> getPassword() async {
    return await _secureStorage.read(key: _keyPasswordHash);
  }

  /// Delete the stored password/pin hash
  Future<void> deletePassword() async {
    await _secureStorage.delete(key: _keyPasswordHash);
  }

  /// Write arbitrary key-value sensitive data
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  /// Read arbitrary key-value sensitive data
  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  /// Delete key-value sensitive data
  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  /// Clear all secure storage entries (useful for data reset/logout)
  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
