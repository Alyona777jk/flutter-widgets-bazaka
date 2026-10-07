import 'dart:math';
import 'package:flutter/material.dart';

class CustomChartWidget extends StatefulWidget {
  final double progress;
  const CustomChartWidget({Key? key, this.progress = 0.85}) : super(key: key);

  @override
  State<CustomChartWidget> createState() => _CustomChartWidgetState();
}

class _CustomChartWidgetState extends State<CustomChartWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _animation = Tween<double>(begin: 0.0, end: widget.progress).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Графік прогресу',
      value: '${(widget.progress * 100).round()}%',
      child: SizedBox(
        width: 100,
        height: 100,
        child: RepaintBoundary(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: _RingChartPainter(progress: _animation.value),
                child: Center(child: Text('${(_animation.value * 100).round()}%', style: const TextStyle(fontWeight: FontWeight.bold))),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _RingChartPainter extends CustomPainter {
  final double progress;
  _RingChartPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - 6;

    final bgPaint = Paint()..color = Colors.deepPurple.shade100..strokeWidth = 10..style = PaintingStyle.stroke;
    final progressPaint = Paint()..color = Colors.deepPurple..strokeWidth = 10..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, 2 * pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant _RingChartPainter oldDelegate) => oldDelegate.progress != progress;
}
