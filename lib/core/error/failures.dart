/// Base abstract class for all domain-level failures.
abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => '$runtimeType(message: $message)';
}

/// Represents failures related to standard network operations or backend communication.
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Represents database failures (Hive cache reads, writes, corruption).
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Represents password storage or biometric authentication failures inside Secure Storage.
class SecureStorageFailure extends Failure {
  const SecureStorageFailure(super.message);
}

/// Represents notification permission, registration, or scheduler failures.
class NotificationFailure extends Failure {
  const NotificationFailure(super.message);
}

/// Represents data format, empty values, or email/password pattern failures.
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}
