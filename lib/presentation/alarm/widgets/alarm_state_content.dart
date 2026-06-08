import 'package:flutter/material.dart';
import 'package:reminder_app/presentation/alarm/blocs/alarm_state.dart';

import 'assistant_orb.dart';
import 'voice_waveform.dart';
import 'success_state.dart';
import 'snoozed_state.dart';

/// Renders the central body content for each [AlarmState].
///
/// Wrap this widget in an [AnimatedSwitcher] (passing a key derived from the
/// state type) so transitions between states animate smoothly.
class AlarmStateContent extends StatelessWidget {
  final AlarmState state;

  const AlarmStateContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state.when(
      initial: _buildSpinner,
      loading: _buildSpinner,
      idle: (_) => _buildIdle(),
      speaking: (_) => _buildSpeaking(),
      delivered: () => const SuccessState(key: ValueKey('delivered_state')),
      snoozedConfirmation: (minutes, ringAt) => SnoozedState(
        key: const ValueKey('snoozed_state'),
        snoozedMinutes: minutes,
        ringAt: ringAt,
      ),
      error: (msg) => _buildError(msg),
    );
  }

  Widget _buildSpinner() => const Center(
    key: ValueKey('loading_state'),
    child: CircularProgressIndicator(
      color: Color(0xFF00BBF9),
      strokeWidth: 2.5,
    ),
  );

  Widget _buildIdle() => Column(
    key: const ValueKey('idle_state'),
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "It's time for a scheduled reminder.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          height: 1.3,
        ),
      ),
      const SizedBox(height: 12),
      Text(
        "Swipe below to hear your reminder.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );

  Widget _buildSpeaking() => Column(
    key: const ValueKey('speaking_state'),
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Delivering your reminder...",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFF00F5D4),
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          shadows: [
            Shadow(
              color: const Color(0xFF00F5D4).withOpacity(0.4),
              blurRadius: 10,
            ),
          ],
        ),
      ),
      const SizedBox(height: 24),
      const AssistantOrb(),
      const SizedBox(height: 24),
      const VoiceWaveform(),
    ],
  );

  Widget _buildError(String message) => Center(
    key: const ValueKey('error_state'),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red.withOpacity(0.85), fontSize: 15),
      ),
    ),
  );
}
