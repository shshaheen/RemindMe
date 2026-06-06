import 'package:flutter/material.dart';

/// App logo with a continuous breathing/pulsing animation.
///
/// [isSpeaking] changes the glow tint from blue (idle) to teal (speaking)
/// to give the user a visual cue that TTS is active.
class PulsingLogo extends StatefulWidget {
  final bool isSpeaking;

  const PulsingLogo({super.key, required this.isSpeaking});

  @override
  State<PulsingLogo> createState() => _PulsingLogoState();
}

class _PulsingLogoState extends State<PulsingLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    _scale = Tween<double>(begin: 0.94, end: 1.06).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final glowColor = widget.isSpeaking
        ? const Color(0xFF00F5D4)
        : const Color(0xFF00BBF9);

    return ScaleTransition(
      scale: _scale,
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
              color: glowColor.withOpacity(0.15),
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
            errorBuilder: (_, __, ___) => Container(
              color: const Color(0xFF1E1A3A),
              child: Icon(
                widget.isSpeaking
                    ? Icons.multitrack_audio_rounded
                    : Icons.assistant_navigation,
                color: glowColor,
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
