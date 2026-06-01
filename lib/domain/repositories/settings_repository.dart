import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/app_settings.dart';

abstract class SettingsRepository {
  /// Fetches cached settings or returns default values
  Future<Either<Failure, AppSettings>> getSettings();

  /// Updates current setting choices in storage
  Future<Either<Failure, void>> updateSettings(AppSettings settings);
}
