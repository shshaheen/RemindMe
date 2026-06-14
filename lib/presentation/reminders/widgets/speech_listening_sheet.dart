import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/speech_input/speech_input_cubit.dart';
import '../cubits/speech_input/speech_input_state.dart';
import '../cubits/speech_input/speech_target_field.dart';

class SpeechListeningSheet extends StatefulWidget {
  final SpeechTargetField targetField;

  const SpeechListeningSheet({
    super.key,
    required this.targetField,
  });

  @override
  State<SpeechListeningSheet> createState() => _SpeechListeningSheetState();
}

class _SpeechListeningSheetState extends State<SpeechListeningSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String _getTargetFieldName() {
    switch (widget.targetField) {
      case SpeechTargetField.title:
        return 'Title';
      case SpeechTargetField.description:
        return 'Description';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<SpeechInputCubit>();

    return BlocConsumer<SpeechInputCubit, SpeechInputState>(
      listener: (context, state) {
        // Scroll to the bottom of transcript automatically as user speaks
        if (state is SpeechInputListening && _scrollController.hasClients) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
              );
            }
          });
        }
      },
      builder: (context, state) {
        final text = state.maybeWhen(
          listening: (_, recognizedText, __) => recognizedText,
          success: (_, recognizedText) => recognizedText,
          orElse: () => '',
        );

        final soundLevel = state.maybeWhen(
          listening: (_, __, level) => level,
          orElse: () => 0.0,
        );

        return WillPopScope(
          onWillPop: () async {
            // Intercept back/swipe gesture to cancel listening correctly
            await cubit.cancelListening();
            return true;
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top drag handle indicator
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.outline.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 24),

                // Field Indicator Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mic_rounded,
                      color: theme.colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Listening for ${_getTargetFieldName()}...',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                // Pulsing Mic & Wave visualizer
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer expanding pulsing rings
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        final pulseScale = 1.0 + (_pulseController.value * 0.2);
                        final voiceScale = 1.0 + (soundLevel * 0.08).clamp(0.0, 1.2);
                        final totalScale = pulseScale * voiceScale;

                        return Container(
                          width: 130,
                          height: 130,
                          transformAlignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.colorScheme.primary.withOpacity(0.08),
                          ),
                          transform: Matrix4.identity()..scale(totalScale),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        final pulseScale = 1.0 + (_pulseController.value * 0.1);
                        final voiceScale = 1.0 + (soundLevel * 0.12).clamp(0.0, 1.0);
                        final totalScale = pulseScale * voiceScale;

                        return Container(
                          width: 100,
                          height: 100,
                          transformAlignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.colorScheme.primary.withOpacity(0.12),
                          ),
                          transform: Matrix4.identity()..scale(totalScale),
                        );
                      },
                    ),

                    // Center mic circle
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.primary,
                            theme.colorScheme.secondary,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.mic_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Live dynamic sound wave visualization bars
                SizedBox(
                  height: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(11, (index) {
                      // Custom heights mapped to decibels with randomized modifiers
                      final seed = sin(index * 0.5) * 0.5 + 0.5;
                      final rawHeight = 6.0 + (soundLevel * 10.0 * seed).clamp(0.0, 26.0);

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        width: 4,
                        height: rawHeight,
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.primary.withOpacity(0.8),
                              theme.colorScheme.secondary.withOpacity(0.8),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 24),

                // Live Transcript Box
                Container(
                  width: double.infinity,
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceVariant.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: theme.colorScheme.outline.withOpacity(0.1),
                    ),
                  ),
                  child: text.trim().isEmpty
                      ? Center(
                          child: Text(
                            'Say something, I\'m listening...',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withOpacity(0.4),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                      : Scrollbar(
                          controller: _scrollController,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              text,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 32),

                // Actions Row
                Row(
                  children: [
                    // Cancel Button
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () async {
                          await cubit.cancelListening();
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          side: BorderSide(
                            color: theme.colorScheme.outline.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Done Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await cubit.stopListening();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
