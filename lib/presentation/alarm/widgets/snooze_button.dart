import 'package:flutter/material.dart';

/// Full-width snooze button with amber pulsing rings and floating Z animations.
class SnoozeButton extends StatefulWidget {
  final VoidCallback onTap;
  const SnoozeButton({super.key, required this.onTap});

  @override
  State<SnoozeButton> createState() => _SnoozeButtonState();
}

class _SnoozeButtonState extends State<SnoozeButton>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _zController;
  late AnimationController _pressController;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
    _zController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..repeat();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.93).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _zController.dispose();
    _pressController.dispose();
    super.dispose();
  }

  Widget _buildFloatingZ(
    String text,
    double phase,
    double size,
    double xOffset,
  ) {
    final v = (_zController.value + phase) % 1.0;
    final yOffset = -(v * 28.0);
    final double opacity = v < 0.4
        ? (v / 0.4)
        : v > 0.7
        ? ((1.0 - v) / 0.3)
        : 1.0;
    return Positioned(
      left: xOffset,
      bottom: 6,
      child: Transform.translate(
        offset: Offset(0, yOffset),
        child: Opacity(
          opacity: (opacity * 0.9).clamp(0.0, 1.0),
          child: Text(
            text,
            style: TextStyle(
              color: const Color(0xFFFFB347),
              fontSize: size,
              fontWeight: FontWeight.w900,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPulseRing(double progress) {
    return Transform.scale(
      scale: 1.0 + progress * 0.10,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color(0xFFFFB347).withOpacity((1.0 - progress) * 0.18),
            width: 1.5,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _pressController.forward(),
      onTapUp: (_) {
        _pressController.reverse();
        widget.onTap();
      },
      onTapCancel: () => _pressController.reverse(),
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _pulseController,
          _zController,
          _pressController,
        ]),
        builder: (context, _) {
          return Transform.scale(
            scale: _scaleAnim.value,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildPulseRing(_pulseController.value),
                  _buildPulseRing((_pulseController.value + 0.5) % 1.0),
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.15),
                        width: 1.5,
                      ),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        // Floating Z letters anchored to right side
                        Positioned(
                          right: 18,
                          top: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: 36,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                _buildFloatingZ('z', 0.00, 10, 0),
                                _buildFloatingZ('z', 0.33, 8, 14),
                                _buildFloatingZ('Z', 0.66, 14, 6),
                              ],
                            ),
                          ),
                        ),
                        // Icon + Label (centred)
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.bedtime_rounded,
                              color: Color(0xFFFFB347),
                              size: 20,
                            ),
                            SizedBox(width: 9),
                            Text(
                              'Snooze',
                              style: TextStyle(
                                color: Color(0xFFFFB347),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.7,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
