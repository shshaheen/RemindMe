import 'dart:math' as math;
import 'package:flutter/material.dart';

class BackgroundParticles extends StatefulWidget {
  const BackgroundParticles({super.key});

  @override
  State<BackgroundParticles> createState() => _BackgroundParticlesState();
}

class _BackgroundParticlesState extends State<BackgroundParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = List.generate(
    22,
    (index) => _Particle.random(),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
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
        for (final p in _particles) {
          p.update();
        }
        return CustomPaint(
          painter: _ParticlePainter(_particles),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class _Particle {
  late double x;
  late double y;
  late double size;
  late double speed;
  late double opacity;
  final math.Random _random = math.Random();

  _Particle.random() {
    x = _random.nextDouble();
    y = _random.nextDouble();
    size = 1.5 + _random.nextDouble() * 3.5;
    speed = 0.0006 + _random.nextDouble() * 0.0012;
    opacity = 0.08 + _random.nextDouble() * 0.35;
  }

  void update() {
    y -= speed;
    if (y < 0) {
      y = 1.0;
      x = _random.nextDouble();
    }
  }
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;

  _ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;
    for (final p in particles) {
      paint.color = const Color(0xFF00F5D4).withOpacity(p.opacity);
      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
