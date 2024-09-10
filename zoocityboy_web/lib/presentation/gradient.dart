// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BackgroundGradientGrid extends StatelessWidget {
  const BackgroundGradientGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return CustomPaint(
      foregroundPainter: GradientBackgroundPainter(
        backgroundColor: colorScheme.surface,
      ),
      child: const GridPaper(
        color: Colors.white12,
        interval: 100,
        divisions: 2,
        subdivisions: 4,
      ),
    );
  }
}

class GradientBackgroundPainter extends CustomPainter {
  final Color backgroundColor;
  GradientBackgroundPainter({
    required this.backgroundColor,
  });
  void drawGradient(Canvas canvas, Size size, paint) {
    paint.shader = RadialGradient(
      colors: [
        Colors.transparent,
        backgroundColor,
      ],
      tileMode: TileMode.clamp,
      center: Alignment.bottomRight,
    ).createShader(Rect.fromCircle(
      center: Offset.zero,
      // radius: 0.5,

      radius: size.height,
    ));
    canvas.drawRect(Rect.largest, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final newSize = Size(size.width, size.height);
    drawGradient(canvas, newSize, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
