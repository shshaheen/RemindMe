import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../../data/datasources/auth_local_data_source.dart';
import '../../data/datasources/reminders_local_data_source.dart';
import '../../data/datasources/settings_local_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/reminders_repository_impl.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/reminders_repository.dart';
import '../../domain/repositories/settings_repository.dart';

import '../../presentation/alarm/blocs/alarm_bloc.dart';
import '../../presentation/auth/blocs/auth_bloc.dart';
import '../../presentation/reminders/blocs/reminders_bloc.dart';
import '../../presentation/settings/blocs/settings_bloc.dart';
import '../services/notification_service.dart';
import '../services/secure_storage_service.dart';
import '../services/alarm_channel_service.dart';
import '../services/tts_service.dart';

final GetIt sl = GetIt.instance;

/// Initialize the dependency injection graph
Future<void> initDI() async {
  // ==========================================
  // 1. External dependencies / platform tools
  // ==========================================

  // Secure Storage
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );

  // Local Notifications Plugin
  sl.registerLazySingleton<FlutterLocalNotificationsPlugin>(
    () => FlutterLocalNotificationsPlugin(),
  );

  // ==========================================
  // 2. Core services wrappers
  // ==========================================
  sl.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(sl<FlutterSecureStorage>()),
  );

  sl.registerLazySingleton<NotificationService>(
    () => NotificationService(sl<FlutterLocalNotificationsPlugin>()),
  );

  sl.registerLazySingleton<AlarmChannelService>(() => AlarmChannelService());

  sl.registerLazySingleton<TtsService>(() => TtsService());

  // ==========================================
  // 3. Features registration blocks
  // ==========================================
  _initAlarmFeature();
  _initAuthFeature();
  _initRemindersFeature();
  _initSettingsFeature();
}

/// Dependency Injection setup for the Authentication feature
void _initAuthFeature() {
  // Blocs (Factories ensure a new instance is created on navigation/mount)
  sl.registerFactory(() => AuthBloc(repository: sl()));

  // Repository implementations
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(secureStorageService: sl()),
  );
}

/// Dependency Injection setup for the Alarm feature
void _initAlarmFeature() {
  // AlarmBloc is a factory so each alarm screen gets a fresh instance.
  sl.registerFactory(
    () => AlarmBloc(
      repository: sl(),
      alarmChannelService: sl(),
      ttsService: sl(),
      notificationService: sl(),
    ),
  );
}

/// Dependency Injection setup for the Reminders feature
void _initRemindersFeature() {
  // Blocs
  sl.registerFactory(() => RemindersBloc(repository: sl()));

  // Repository implementations
  sl.registerLazySingleton<RemindersRepository>(
    () => RemindersRepositoryImpl(
      localDataSource: sl(),
      notificationService: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RemindersLocalDataSource>(
    () => const RemindersLocalDataSourceImpl(),
  );
}

/// Dependency Injection setup for the Settings feature
void _initSettingsFeature() {
  // Blocs
  sl.registerFactory(() => SettingsBloc(repository: sl()));

  // Repository implementations
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<SettingsLocalDataSource>(
    () => const SettingsLocalDataSourceImpl(),
  );
}
