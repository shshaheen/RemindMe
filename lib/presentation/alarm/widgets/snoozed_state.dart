import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Confirmation widget shown after the user snoozes an alarm.
/// Displays an orbiting moon animation with the snooze duration and next ring time.
class SnoozedState extends StatefulWidget {
  final int snoozedMinutes;
  final DateTime ringAt;

  const SnoozedState({
    super.key,
    required this.snoozedMinutes,
    required this.ringAt,
  });

  @override
  State<SnoozedState> createState() => _SnoozedStateState();
}

class _SnoozedStateState extends State<SnoozedState>
    with TickerProviderStateMixin {
  late AnimationController _entranceController;
  late AnimationController _orbitController;
  late Animation<double> _scale;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scale = CurvedAnimation(parent: _entranceController, curve: Curves.elasticOut);
    _fade = CurvedAnimation(parent: _entranceController, curve: Curves.easeOut);

    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _entranceController.forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _orbitController.dispose();
    super.dispose();
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour;
    final m = dt.minute.toString().padLeft(2, '0');
    final period = h >= 12 ? 'PM' : 'AM';
    final hour = h > 12 ? h - 12 : (h == 0 ? 12 : h);
    return '$hour:$m $period';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _fade,
        child: ScaleTransition(
          scale: _scale,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _orbitController,
                builder: (context, _) {
                  final angle = _orbitController.value * 2 * math.pi;
                  final pulseProgress = _orbitController.value % 0.5;
                  return SizedBox(
                    width: 130,
                    height: 130,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Large orbiting dot
                        Transform.translate(
                          offset: Offset(52 * math.cos(angle), 52 * math.sin(angle)),
                          child: Container(
                            width: 9, height: 9,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFFFB347).withOpacity(0.75),
                              boxShadow: [BoxShadow(color: const Color(0xFFFFB347).withOpacity(0.5), blurRadius: 8, spreadRadius: 1)],
                            ),
                          ),
                        ),
                        // Small trailing dot (opposite phase)
                        Transform.translate(
                          offset: Offset(42 * math.cos(angle + math.pi), 42 * math.sin(angle + math.pi)),
                          child: Container(
                            width: 5, height: 5,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFFFFB347).withOpacity(0.35)),
                          ),
                        ),
                        // Expanding pulse ring
                        Transform.scale(
                          scale: 1.0 + pulseProgress * 0.25,
                          child: Container(
                            width: 92, height: 92,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFFFB347).withOpacity((0.5 - pulseProgress) * 0.45),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        // Moon circle core
                        Container(
                          width: 76, height: 76,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFB347).withOpacity(0.12),
                            border: Border.all(color: const Color(0xFFFFB347), width: 2.5),
                            boxShadow: [BoxShadow(color: const Color(0xFFFFB347).withOpacity(0.4), blurRadius: 28, spreadRadius: 3)],
                          ),
                          child: const Icon(Icons.bedtime_rounded, color: Color(0xFFFFB347), size: 38),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 28),
              Text(
                'Snoozed for ${widget.snoozedMinutes} min',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_rounded, color: const Color(0xFFFFB347).withOpacity(0.7), size: 14),
                  const SizedBox(width: 5),
                  Text(
                    'Ring again at ${_formatTime(widget.ringAt)}',
                    style: TextStyle(
                      color: const Color(0xFFFFB347).withOpacity(0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
