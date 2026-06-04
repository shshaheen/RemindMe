import 'package:flutter/material.dart';

class AssistantOrb extends StatefulWidget {
  const AssistantOrb({super.key});

  @override
  State<AssistantOrb> createState() => _AssistantOrbState();
}

class _AssistantOrbState extends State<AssistantOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            _buildPulseRing(1.5, 0.1),
            _buildPulseRing(1.25, 0.22),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [
                    Color(0xFF00F5D4),
                    Color(0xFF7B2CBF),
                  ],
                  radius: 0.85,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00F5D4).withOpacity(0.35),
                    blurRadius: 25,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.multitrack_audio_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPulseRing(double maxScale, double maxOpacity) {
    final double progress = _controller.value;
    final double scale = 1.0 + (maxScale - 1.0) * progress;
    final double opacity = maxOpacity * (1.0 - progress);

    return Transform.scale(
      scale: scale,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF00F5D4).withOpacity(opacity),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
