import 'package:go_router/go_router.dart';
import 'package:reminder_app/presentation/auth/pages/login_page.dart';
import 'package:reminder_app/presentation/reminders/pages/reminders_dashboard_page.dart';
import 'package:reminder_app/presentation/settings/pages/settings_page.dart';

class AppRouter {
  AppRouter._();

  static const String loginPath = '/login';
  static const String remindersPath = '/reminders';
  static const String settingsPath = '/settings';

  static final GoRouter router = GoRouter(
    initialLocation: loginPath,
    routes: [
      GoRoute(
        path: loginPath,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: remindersPath,
        name: 'reminders',
        builder: (context, state) => const RemindersDashboardPage(),
      ),
      GoRoute(
        path: settingsPath,
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
