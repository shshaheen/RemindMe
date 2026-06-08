import 'package:flutter/material.dart';
import 'package:reminder_app/presentation/alarm/blocs/alarm_state.dart';

import 'animated_button.dart';
import 'snooze_button.dart';
import 'swipe_to_hear_button.dart';

/// Renders the correct set of action controls for the current [AlarmState].
///
/// Contains its own [AnimatedSwitcher] so transitions between action sets
/// are animated independently from the central content area.
class AlarmBottomActions extends StatelessWidget {
  final AlarmState state;
  final VoidCallback onAccept;
  final VoidCallback onSnooze;
  final VoidCallback onDismiss;

  const AlarmBottomActions({
    super.key,
    required this.state,
    required this.onAccept,
    required this.onSnooze,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: state.maybeWhen(
        // No actions once the reminder has been delivered or snoozed.
        delivered: () => const SizedBox.shrink(key: ValueKey('empty_actions')),
        snoozedConfirmation: (_, __) =>
            const SizedBox.shrink(key: ValueKey('snoozed_empty_actions')),

        // While speaking, only a Dismiss button is offered.
        speaking: (_) => Center(
          key: const ValueKey('speaking_actions'),
          child: AnimatedButton(
            onPressed: onDismiss,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withOpacity(0.15),
                  width: 1.5,
                ),
                color: Colors.white.withOpacity(0.02),
              ),
              child: const Text(
                'Dismiss',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),

        // Default (idle / loading / error): full set of controls.
        orElse: () => Column(
          key: const ValueKey('idle_actions'),
          mainAxisSize: MainAxisSize.min,
          children: [
            SwipeToHearButton(onSwipeComplete: onAccept),
            const SizedBox(height: 14),
            SnoozeButton(onTap: onSnooze),
            const SizedBox(height: 14),
            AnimatedButton(
              onPressed: onDismiss,
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.15),
                    width: 1.5,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Dismiss',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
