import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alarm/alarm.dart';
import 'package:go_router/go_router.dart';

import '../blocs/alarm_bloc.dart';
import '../blocs/alarm_event.dart';
import '../blocs/alarm_state.dart';
import '../widgets/alarm_bottom_actions.dart';
import '../widgets/alarm_state_content.dart';
import '../widgets/background_particles.dart';
import '../widgets/pulsing_logo.dart';

/// Entry point for the alarm screen.
///
/// Kept intentionally thin: it simply owns the [reminderId] passed from the
/// router and delegates all logic to the [AlarmBloc] provided by
/// [app_router.dart].
class AlarmScreen extends StatelessWidget {
  final String reminderId;

  const AlarmScreen({super.key, required this.reminderId});

  @override
  Widget build(BuildContext context) => _AlarmView(reminderId: reminderId);
}

// ---------------------------------------------------------------------------
// Private view — consumes [AlarmBloc] and renders the full screen.
// Only the page-entrance animation lives here; all other animation is
// encapsulated in dedicated widgets (PulsingLogo, AlarmStateContent, etc.).
// ---------------------------------------------------------------------------

class _AlarmView extends StatefulWidget {
  final String reminderId;

  const _AlarmView({super.key, required this.reminderId});

  @override
  State<_AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<_AlarmView>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _entranceController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOut,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _entranceController,
            curve: Curves.easeOutCubic,
          ),
        );
    _entranceController.forward();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _entranceController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkAlarmStatus();
    }
  }

  Future<void> _checkAlarmStatus() async {
    final notificationId = widget.reminderId.hashCode.abs() & 0x7FFFFFFF;
    final isRinging = await Alarm.isRinging(notificationId);
    if (!isRinging && mounted) {
      if (kDebugMode) {
        debugPrint('AlarmScreen: Alarm ${widget.reminderId} (notification: $notificationId) is no longer ringing. Redirecting to home.');
      }
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlarmBloc, AlarmState>(
      builder: (context, state) {
        final isSpeaking = state.maybeWhen(
          speaking: (_) => true,
          orElse: () => false,
        );

        return Scaffold(
          body: Stack(
            children: [
              // 1. Deep-space background gradient
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0F0C20),
                      Color(0xFF15102A),
                      Color(0xFF0A0815),
                    ],
                  ),
                ),
              ),

              // 2. Continuous 60 fps floating particle background
              const BackgroundParticles(),

              // 3. Main layout — entrance-animated
              SafeArea(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 24.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),

                          // Brand header
                          Text(
                            'ReminderMe',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.95),
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2.0,
                              shadows: [
                                Shadow(
                                  color: const Color(
                                    0xFF00F5D4,
                                  ).withOpacity(0.3),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 40),

                          // Breathing logo — animation fully encapsulated
                          PulsingLogo(isSpeaking: isSpeaking),

                          const Spacer(),

                          // State-driven central content
                          Expanded(
                            flex: 6,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 600),
                              switchInCurve: Curves.easeInOutCubic,
                              switchOutCurve: Curves.easeInOutCubic,
                              child: AlarmStateContent(
                                key: ValueKey(state.runtimeType),
                                state: state,
                              ),
                            ),
                          ),

                          const Spacer(),

                          // Action buttons — own animated switcher inside
                          AlarmBottomActions(
                            state: state,
                            onAccept: () => context.read<AlarmBloc>().add(
                              const AlarmEvent.accepted(),
                            ),
                            onSnooze: () => context.read<AlarmBloc>().add(
                              const AlarmEvent.snoozed(),
                            ),
                            onDismiss: () => context.read<AlarmBloc>().add(
                              const AlarmEvent.dismissed(),
                            ),
                          ),

                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
