import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_app/core/router/app_router.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final state = context.read<AuthBloc>().state;
        _handleAuthState(state);
      }
    });
  }

  void _handleAuthState(AuthState state) {
    state.maybeWhen(
      needsPasswordSetup: () => context.go(AppRouter.createPasswordScreen),
      unauthenticated: () => context.go(AppRouter.loginScreen),
      authenticated: () => context.go(AppRouter.remindersScreen),
      error: (msg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: Colors.red),
        );
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => _handleAuthState(state),
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary.withAlpha(20),
                  Theme.of(context).colorScheme.surface,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const Spacer(),

                  Image.asset(
                    'assets/images/reminderMe.png',
                    height: 260,
                    width: 260,
                  ),

                  const SizedBox(height: 32),

                  Text(
                    'ReminderMe',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Never miss what matters',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),

                  const SizedBox(height: 40),

                  const CircularProgressIndicator(),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
