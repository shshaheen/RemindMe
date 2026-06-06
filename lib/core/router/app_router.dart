import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_app/domain/entities/reminder.dart';
import '../../core/di/injection_container.dart';
import '../../presentation/alarm/blocs/alarm_bloc.dart';
import '../../presentation/alarm/blocs/alarm_event.dart';
import '../../presentation/auth/pages/splash_page.dart';
import '../../presentation/auth/pages/create_password_page.dart';
import '../../presentation/auth/pages/login_page.dart';
import '../../presentation/auth/pages/change_password_page.dart';
import '../../presentation/reminders/pages/reminders_dashboard_page.dart';
import '../../presentation/reminders/pages/add_reminder_page.dart';
import '../../presentation/alarm/pages/alarm_screen.dart';

class AppRouter {
  AppRouter._();

  static const String splashScreen = '/';
  static const String createPasswordScreen = '/create-password';
  static const String loginScreen = '/login';
  static const String changePasswordScreen = '/change-password';
  static const String remindersScreen = '/reminders';
  static const String addReminderScreen = '/add-reminder';
  static const String editReminderScreen = '/edit-reminder';
  static const String alarmScreen = '/alarm';

  static final GoRouter router = GoRouter(
    initialLocation: splashScreen,
    routes: [
      GoRoute(
        path: splashScreen,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: createPasswordScreen,
        name: 'create-password',
        builder: (context, state) => const CreatePasswordPage(),
      ),
      GoRoute(
        path: loginScreen,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: changePasswordScreen,
        name: 'change-password',
        builder: (context, state) => const ChangePasswordPage(),
      ),
      GoRoute(
        path: remindersScreen,
        name: 'reminders',
        builder: (context, state) => const RemindersDashboardPage(),
      ),
      GoRoute(
        path: addReminderScreen,
        name: 'add-reminder',
        builder: (context, state) => const AddReminderPage(),
      ),
      GoRoute(
        path: editReminderScreen,
        name: 'edit-reminder',
        builder: (context, state) {
          final reminder = state.extra as Reminder;
          return AddReminderPage(reminder: reminder);
        },
      ),
      GoRoute(
        path: alarmScreen,
        name: 'alarm',
        builder: (context, state) {
          final id = state.uri.queryParameters['id'] ?? '';
          return BlocProvider(
            create: (_) =>
                sl<AlarmBloc>()..add(AlarmEvent.started(reminderId: id)),
            child: AlarmScreen(reminderId: id),
          );
        },
      ),
    ],
  );
}
