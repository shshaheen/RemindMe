import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';

abstract class AuthRepository {
  /// Checks if a master password has already been set on this device.
  Future<Either<Failure, bool>> hasPassword();

  /// Sets/registers the new master password securely.
  Future<Either<Failure, void>> setPassword(String password);

  /// Validates the provided password against the securely stored master password.
  Future<Either<Failure, bool>> validatePassword(String password);

  /// Changes the master password, validating the current old password first.
  Future<Either<Failure, void>> changePassword(String oldPassword, String newPassword);

  /// Clears the authenticated session state / locks the app.
  Future<Either<Failure, void>> logout();
}
