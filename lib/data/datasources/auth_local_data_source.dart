import '../../core/services/secure_storage_service.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  /// Caches the user profile model to Hive local storage
  Future<void> cacheUserModel(UserModel user);

  /// Retrieves the cached user profile model from Hive local storage
  Future<UserModel?> getCachedUserModel();

  /// Clears user profile caches upon sign out
  Future<void> clearAuthCache();

  /// Securely saves the password hash inside Key-Value Secure Storage
  Future<void> savePasswordHash(String passwordHash);

  /// Retrieves the stored password hash from Secure Storage
  Future<String?> getPasswordHash();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageService secureStorageService;

  AuthLocalDataSourceImpl({required this.secureStorageService});

  @override
  Future<void> cacheUserModel(UserModel user) async {
    // Setup for storing in Hive authBox
  }

  @override
  Future<UserModel?> getCachedUserModel() async {
    // Setup for fetching from Hive authBox
    return null;
  }

  @override
  Future<void> clearAuthCache() async {
    await secureStorageService.deletePassword();
  }

  @override
  Future<void> savePasswordHash(String passwordHash) async {
    await secureStorageService.savePassword(passwordHash);
  }

  @override
  Future<String?> getPasswordHash() async {
    return await secureStorageService.getPassword();
  }
}
