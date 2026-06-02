import 'package:go_router/go_router.dart';
import '../../domain/entities/reminder.dart';
import '../../presentation/auth/pages/splash_page.dart';
import '../../presentation/auth/pages/create_password_page.dart';
import '../../presentation/auth/pages/login_page.dart';
import '../../presentation/auth/pages/change_password_page.dart';
import '../../presentation/reminders/pages/reminders_dashboard_page.dart';
import '../../presentation/reminders/pages/add_reminder_page.dart';
import '../../presentation/reminders/pages/edit_reminder_page.dart';
import '../../presentation/settings/pages/settings_page.dart';

class AppRouter {
  AppRouter._();

  static const String splashPath = '/';
  static const String createPasswordPath = '/create-password';
  static const String loginPath = '/login';
  static const String changePasswordPath = '/change-password';
  static const String remindersPath = '/reminders';
  static const String addReminderPath = '/add-reminder';
  static const String editReminderPath = '/edit-reminder';
  static const String settingsPath = '/settings';

  static final GoRouter router = GoRouter(
    initialLocation: splashPath,
    routes: [
      GoRoute(
        path: splashPath,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: createPasswordPath,
        name: 'create-password',
        builder: (context, state) => const CreatePasswordPage(),
      ),
      GoRoute(
        path: loginPath,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: changePasswordPath,
        name: 'change-password',
        builder: (context, state) => const ChangePasswordPage(),
      ),
      GoRoute(
        path: remindersPath,
        name: 'reminders',
        builder: (context, state) => const RemindersDashboardPage(),
      ),
      GoRoute(
        path: addReminderPath,
        name: 'add-reminder',
        builder: (context, state) => const AddReminderPage(),
      ),
      GoRoute(
        path: editReminderPath,
        name: 'edit-reminder',
        builder: (context, state) {
          final reminder = state.extra as Reminder;
          return EditReminderPage(reminder: reminder);
        },
      ),
      GoRoute(
        path: settingsPath,
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
