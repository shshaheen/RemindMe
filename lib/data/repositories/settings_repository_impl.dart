import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_data_source.dart';
import '../models/settings_model.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, AppSettings>> getSettings() async {
    try {
      final model = await localDataSource.getSettings();
      if (model != null) {
        return Right(model.toDomain());
      }
      // Defaults when no preferences cached yet
      return const Right(AppSettings(
        isDarkMode: false,
        isSoundEnabled: true,
        isVibrationEnabled: true,
      ));
    } catch (e) {
      return Left(CacheFailure('Failed to retrieve preference states: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> updateSettings(AppSettings settings) async {
    try {
      final model = SettingsModel.fromDomain(settings);
      await localDataSource.saveSettings(model);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to save preference configurations: ${e.toString()}'));
    }
  }
}
