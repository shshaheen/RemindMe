import 'dart:math' as math;
import 'package:flutter/material.dart';

class VoiceWaveform extends StatefulWidget {
  const VoiceWaveform({super.key});

  @override
  State<VoiceWaveform> createState() => _VoiceWaveformState();
}

class _VoiceWaveformState extends State<VoiceWaveform>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<double> _baseHeights = [
    10.0,
    22.0,
    32.0,
    42.0,
    28.0,
    38.0,
    20.0,
    12.0,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(_baseHeights.length, (index) {
          final double delay = index / _baseHeights.length;
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final double progress = (_controller.value + delay) % 1.0;
              final double value = math.sin(progress * 2 * math.pi);
              final double height = 8 + (_baseHeights[index] - 8) * value.abs();

              return Container(
                width: 5,
                height: height,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF00F5D4), Color(0xFF00BBF9)],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
