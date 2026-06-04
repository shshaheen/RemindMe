import 'dart:math' as math;
import 'package:flutter/material.dart';

class SwipeToHearButton extends StatefulWidget {
  final VoidCallback onSwipeComplete;
  const SwipeToHearButton({super.key, required this.onSwipeComplete});

  @override
  State<SwipeToHearButton> createState() => _SwipeToHearButtonState();
}

class _SwipeToHearButtonState extends State<SwipeToHearButton>
    with SingleTickerProviderStateMixin {
  double _dragPosition = 0.0;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 58.0;
    const double thumbSize = 48.0;
    const double padding = 5.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxDrag = constraints.maxWidth - thumbSize - (padding * 2);

        return Container(
          height: buttonHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white.withOpacity(0.04),
            border: Border.all(
              color: Colors.white.withOpacity(0.08),
              width: 1.5,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Sliding text prompt
              Opacity(
                opacity: (1.0 - (_dragPosition / maxDrag) * 1.5).clamp(0.0, 1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: thumbSize),
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        return ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              colors: const [
                                Colors.white54,
                                Color(0xFF00F5D4),
                                Colors.white54,
                              ],
                              stops: [
                                (_pulseController.value - 0.25).clamp(0.0, 1.0),
                                _pulseController.value,
                                (_pulseController.value + 0.25).clamp(0.0, 1.0),
                              ],
                            ).createShader(bounds);
                          },
                          child: const Text(
                            'Swipe to Hear',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Slidable thumb
              Positioned(
                left: padding + _dragPosition,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _dragPosition = (_dragPosition + details.delta.dx)
                          .clamp(0.0, maxDrag);
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    if (_dragPosition >= maxDrag * 0.85) {
                      // Trigger complete
                      setState(() {
                        _dragPosition = maxDrag;
                      });
                      widget.onSwipeComplete();
                    } else {
                      // Return back with animation
                      _animateBack();
                    }
                  },
                  child: Container(
                    width: thumbSize,
                    height: thumbSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF00F5D4),
                          Color(0xFF00BBF9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00F5D4).withOpacity(0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xFF0A0815),
                      size: 24,
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

  void _animateBack() {
    final double startPosition = _dragPosition;
    final int steps = 15;
    int currentStep = 0;
    
    // Simple timer animation back to 0
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 10));
      if (!mounted) return false;
      
      currentStep++;
      final double progress = currentStep / steps;
      // Ease out cubic back
      final double easeFactor = 1.0 - math.pow(progress, 3).toDouble();
      
      setState(() {
        _dragPosition = startPosition * easeFactor;
      });
      
      return currentStep < steps;
    });
  }
}
