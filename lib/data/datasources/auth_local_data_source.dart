import '../../core/services/secure_storage_service.dart';

abstract class AuthLocalDataSource {
  /// Checks if a password has been set in secure storage
  Future<bool> hasPassword();

  /// Securely saves the master password inside Key-Value Secure Storage
  Future<void> savePasswordHash(String passwordHash);

  /// Retrieves the stored password hash from Secure Storage
  Future<String?> getPasswordHash();

  /// Clears the saved master password from secure storage
  Future<void> clearAuthCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageService secureStorageService;

  AuthLocalDataSourceImpl({required this.secureStorageService});

  @override
  Future<bool> hasPassword() async {
    final password = await secureStorageService.getPassword();
    return password != null && password.isNotEmpty;
  }

  @override
  Future<void> savePasswordHash(String passwordHash) async {
    await secureStorageService.savePassword(passwordHash);
  }

  @override
  Future<String?> getPasswordHash() async {
    return await secureStorageService.getPassword();
  }

  @override
  Future<void> clearAuthCache() async {
    await secureStorageService.deletePassword();
  }
}
