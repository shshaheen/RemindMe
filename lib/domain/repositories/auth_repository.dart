import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  /// Authenticates the user with username and password, returning User or Failure
  Future<Either<Failure, User>> login(String username, String password);

  /// Performs user sign out, clearing auth session tokens
  Future<Either<Failure, void>> logout();

  /// Gets currently cached authenticated user, if any
  Future<Either<Failure, User?>> getCachedUser();
}
