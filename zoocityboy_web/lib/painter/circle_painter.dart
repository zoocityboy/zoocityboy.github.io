import 'dart:math';

import 'package:flutter/material.dart';

class CircleView extends StatelessWidget {
  const CircleView({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      child: CustomPaint(
        painter: _OpenPainter(
          radius: 150,
          color: isDark ? Colors.white10 : Colors.black12,
          offset: Offset.zero,
        ),
        child: child,
      ),
    );
  }
}

class _OpenPainter extends CustomPainter {
  _OpenPainter({
    this.radius = 200,
    this.color = Colors.white30,
    this.offset = Offset.zero,
  });
  final double radius;
  final Color color;
  final Offset offset;
  @override
  void paint(Canvas canvas, Size size) {
    const counter = 20;
    for (var i = 1; i < counter; i++) {
      final startOpacity = color.opacity;
      final opacity = 1 - ((100 / i) / 100);
      // print('opacity[$startOpacity][$i]: $opacity / ${startOpacity * opacity}');
      final paint = Paint()
        ..color = color.withAlpha(max(0, 50 - (i * 5)))
        // ..color = color.withOpacity(1 - opacity)
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(
        Offset(offset.dx + size.width / 2, offset.dy + size.height / 2),
        radius + ((16 + (i * 2)) * i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
