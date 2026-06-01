import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> hasPassword() async {
    try {
      final exists = await localDataSource.hasPassword();
      return Right(exists);
    } catch (e) {
      return Left(SecureStorageFailure('Failed to check passcode status: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> setPassword(String password) async {
    try {
      await localDataSource.savePasswordHash(password);
      return const Right(null);
    } catch (e) {
      return Left(SecureStorageFailure('Failed to securely save passcode: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> validatePassword(String password) async {
    try {
      final storedHash = await localDataSource.getPasswordHash();
      final isValid = storedHash == password;
      return Right(isValid);
    } catch (e) {
      return Left(SecureStorageFailure('Failed to validate passcode: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(String oldPassword, String newPassword) async {
    try {
      final storedHash = await localDataSource.getPasswordHash();
      if (storedHash != oldPassword) {
        return const Left(ValidationFailure('Incorrect current password'));
      }
      await localDataSource.savePasswordHash(newPassword);
      return const Right(null);
    } catch (e) {
      return Left(SecureStorageFailure('Failed to update master passcode: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // For local app lock, logout means locking the app in memory (handled by BLoC state)
    // We do not delete the stored passcode, so the user can unlock it again later.
    return const Right(null);
  }
}
