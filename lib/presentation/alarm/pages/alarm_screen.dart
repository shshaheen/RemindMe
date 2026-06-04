import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:reminder_app/core/di/injection_container.dart';
import 'package:reminder_app/core/services/alarm_channel_service.dart';
import 'package:reminder_app/core/services/hive_service.dart';
import 'package:reminder_app/core/services/notification_service.dart';
import 'package:reminder_app/data/models/reminder_model.dart';
import 'package:reminder_app/domain/entities/reminder.dart';
import 'package:reminder_app/core/services/tts_service.dart';

// Custom modular sub-widgets imports
import '../widgets/background_particles.dart';
import '../widgets/assistant_orb.dart';
import '../widgets/voice_waveform.dart';
import '../widgets/success_state.dart';
import '../widgets/animated_button.dart';
import '../widgets/swipe_to_hear_button.dart';

enum AlarmState { idle, speaking, delivered }

class AlarmScreen extends StatefulWidget {
  final String reminderId;

  const AlarmScreen({super.key, required this.reminderId});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoScale;
  
  late AnimationController _entranceController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  Reminder? _reminder;
  AlarmState _currentState = AlarmState.idle;

  @override
  void initState() {
    super.initState();

    // Start Ringtone & turn screen on (continuous)
    sl<AlarmChannelService>().startRingtone();
    sl<AlarmChannelService>().turnScreenOn();

    // Fetch the reminder details synchronously from Hive
    final model = HiveService.remindersBox.get(widget.reminderId) as ReminderModel?;
    _reminder = model?.toDomain();

    // Configure a breathing/pulsing animation for the app logo
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    _logoScale = Tween<double>(begin: 0.94, end: 1.06).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    // Smooth page entrance transition
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _entranceController, curve: Curves.easeOutCubic),
    );

    _entranceController.forward();
  }

  @override
  void dispose() {
    // Ensure sound is stopped
    sl<AlarmChannelService>().stopRingtone();
    _logoController.dispose();
    _entranceController.dispose();
    super.dispose();
  }

  Future<void> _handleAccept() async {
    // Stop continuous sound
    await sl<AlarmChannelService>().stopRingtone();

    // Cancel OS notification
    final notificationId = widget.reminderId.hashCode.abs() & 0x7FFFFFFF;
    await sl<NotificationService>().cancelNotification(notificationId);

    // Dismiss keyguard
    await sl<AlarmChannelService>().dismissKeyguard();

    if (mounted) {
      setState(() {
        _currentState = AlarmState.speaking;
      });
    }

    // Speak details
    final title = _reminder?.title ?? 'Scheduled Reminder';
    final desc = _reminder?.description ?? '';
    await sl<TtsService>().speakReminder(
      title: title,
      description: desc,
      onComplete: _onSpeechFinished,
    );
  }

  Future<void> _onSpeechFinished() async {
    if (mounted) {
      setState(() {
        _currentState = AlarmState.delivered;
      });
      
      // Keep delivered screen showing for 1.8 seconds before closing app
      Future.delayed(const Duration(milliseconds: 1800), () async {
        if (mounted) {
          await sl<AlarmChannelService>().closeApp();
        }
      });
    }
  }

  Future<void> _handleDismiss() async {
    // Stop sound and TTS
    await sl<AlarmChannelService>().stopRingtone();
    await sl<TtsService>().stop();

    // Cancel notification
    final notificationId = widget.reminderId.hashCode.abs() & 0x7FFFFFFF;
    await sl<NotificationService>().cancelNotification(notificationId);

    if (mounted) {
      await sl<AlarmChannelService>().closeApp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Deep space background gradient
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

          // 2. Continuous 60fps floating particle background
          const BackgroundParticles(),

          // 3. Main layout content
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      
                      // Brand Header
                      Text(
                        'ReminderMe',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.95),
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.0,
                          shadows: [
                            Shadow(
                              color: const Color(0xFF00F5D4).withOpacity(0.3),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 40),

                      // Breathing App Logo with Premium assistant glow
                      ScaleTransition(
                        scale: _logoScale,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.04),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.08),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _currentState == AlarmState.speaking
                                    ? const Color(0xFF00F5D4).withOpacity(0.15)
                                    : const Color(0xFF00BBF9).withOpacity(0.15),
                                blurRadius: 40,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(12),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/reminderMe.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFF1E1A3A),
                                  child: Icon(
                                    _currentState == AlarmState.speaking
                                        ? Icons.multitrack_audio_rounded
                                        : Icons.assistant_navigation,
                                    color: _currentState == AlarmState.speaking
                                        ? const Color(0xFF00F5D4)
                                        : const Color(0xFF00BBF9),
                                    size: 50,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      // Animated Switcher for the interactive assistant states
                      Expanded(
                        flex: 6,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          switchInCurve: Curves.easeInOutCubic,
                          switchOutCurve: Curves.easeInOutCubic,
                          child: _buildStateContent(),
                        ),
                      ),

                      const Spacer(),

                      // Bottom actions section
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: _buildBottomActions(),
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
  }

  Widget _buildStateContent() {
    switch (_currentState) {
      case AlarmState.idle:
        return Column(
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
      case AlarmState.speaking:
        return Column(
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
      case AlarmState.delivered:
        return const SuccessState(key: ValueKey('delivered_state'));
    }
  }

  Widget _buildBottomActions() {
    if (_currentState == AlarmState.delivered) {
      return const SizedBox.shrink(key: ValueKey('empty_actions'));
    }

    if (_currentState == AlarmState.speaking) {
      return Center(
        key: const ValueKey('speaking_actions'),
        child: AnimatedButton(
          onPressed: _handleDismiss,
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
      );
    }

    // Default Idle Action Buttons
    return Column(
      key: const ValueKey('idle_actions'),
      mainAxisSize: MainAxisSize.min,
      children: [
        SwipeToHearButton(
          onSwipeComplete: _handleAccept,
        ),
        const SizedBox(height: 16),
        AnimatedButton(
          onPressed: _handleDismiss,
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
    );
  }
}
