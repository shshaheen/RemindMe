import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    try {
      // Production architecture shell: mock login verification & caching
      final userModel = UserModel(
        id: 'user_123',
        username: username,
        email: '$username@example.com',
      );
      await localDataSource.cacheUserModel(userModel);
      await localDataSource.savePasswordHash(password);
      return Right(userModel.toDomain());
    } catch (e) {
      return Left(CacheFailure('Failed to save authentication parameters: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearAuthCache();
      return const Right(null);
    } catch (e) {
      return Left(SecureStorageFailure('Logout operation encountered errors: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User?>> getCachedUser() async {
    try {
      final userModel = await localDataSource.getCachedUserModel();
      return Right(userModel?.toDomain());
    } catch (e) {
      return Left(CacheFailure('Cache reading operation failed: ${e.toString()}'));
    }
  }
}
