import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart';
import 'core/router/app_router.dart';
import 'core/services/hive_service.dart';
import 'core/services/notification_service.dart';
import 'core/theme/app_theme.dart';
import 'package:reminder_app/presentation/auth/blocs/auth_bloc.dart';
import 'package:reminder_app/presentation/auth/blocs/auth_event.dart';
import 'package:reminder_app/presentation/reminders/blocs/reminders_bloc.dart';
import 'package:reminder_app/presentation/reminders/blocs/reminders_event.dart';
import 'package:reminder_app/presentation/settings/blocs/settings_bloc.dart';
import 'package:reminder_app/presentation/settings/blocs/settings_event.dart';
import 'package:reminder_app/presentation/settings/blocs/settings_state.dart';

void main() {
  // Zone-based error trapping for high stability in production environment
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // 1. Initialize Dependency Injection Graph
      await initDI();

      // 2. Initialize Hive local databases
      await HiveService.init();

      // 3. Initialize Notification system & Timezones
      await sl<NotificationService>().init();

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<SettingsBloc>(
              create: (context) =>
                  sl<SettingsBloc>()..add(const SettingsEvent.started()),
            ),
            BlocProvider<AuthBloc>(
              create: (context) =>
                  sl<AuthBloc>()..add(const AuthEvent.started()),
            ),
            BlocProvider<RemindersBloc>(
              create: (context) =>
                  sl<RemindersBloc>()
                    ..add(const RemindersEvent.loadReminders()),
            ),
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print('Caught unhandled global error: $error');
        print(stackTrace);
      }
      // Integrate Crashlytics or remote error reporting here
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        // Resolve theme mode dynamically depending on Settings state
        final bool isDarkMode = state.maybeWhen(
          loaded: (settings) => settings.isDarkMode,
          orElse: () => false,
        );

        return MaterialApp.router(
          title: 'RemindMe',
          debugShowCheckedModeBanner: false,

          // Material 3 Custom Theme definitions
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

          // Declarative Navigation configuration using GoRouter
          routerConfig: AppRouter.router,

          // Smooth global transition animation when changing theme modes
          builder: (context, child) {
            return AnimatedTheme(
              data: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic, 
              child: child!,
            );
          },
        );
      },
    );
  }
}
