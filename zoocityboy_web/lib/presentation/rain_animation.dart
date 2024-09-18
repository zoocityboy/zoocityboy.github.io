import 'dart:math';

import 'package:flutter/material.dart';

class RainAnimation extends StatefulWidget {
  const RainAnimation({super.key, required this.child});
  final Widget child;

  @override
  _RainAnimationState createState() => _RainAnimationState();
}

class _RainAnimationState extends State<RainAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Raindrop> _raindrops = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();

    // _raindrops = List.generate(100, (index) => Raindrop(MediaQuery.sizeOf(context)));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _raindrops = List.generate(100, (index) => Raindrop(MediaQuery.of(context).size));
      });
    });

    _controller.addListener(() {
      setState(() {
        for (var raindrop in _raindrops) {
          raindrop.fall();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RainPainter(_raindrops),
      child: widget.child,
    );
  }
}

class Raindrop {
  double x;
  double y;
  double length;
  double speed;
  Size screen;
  Raindrop(this.screen)
      : x = Random().nextDouble() * screen.width,
        y = Random().nextDouble() * screen.height,
        length = Random().nextDouble() * 20 + 10,
        speed = Random().nextDouble() * 4 + 2;

  void fall() {
    y += speed;
    if (y > screen.height) {
      y = 0;
      x = Random().nextDouble() * screen.width;
    }
  }
}

class RainPainter extends CustomPainter {
  final List<Raindrop> raindrops;

  RainPainter(this.raindrops);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white10
      ..strokeWidth = 1.0;
    final paint1 = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    for (var raindrop in raindrops) {
      // final p = paint..color = Colors.white.withOpacity(.5 - (raindrop.y / size.height));
      canvas.drawLine(
        Offset(raindrop.x, raindrop.y),
        Offset(raindrop.x, raindrop.y + raindrop.length),
        paint,
      );
    }
    // canvas.drawCircle(
    //   Offset(size.width / 2, size.height / 2),
    //   size.width / 3,
    //   paint,
    // );
    // Draw the background
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint1,
    );

    final holePosition = Offset(size.width / 2, size.height / 2);
    final holeRadius = size.width / 4;
    // Create a path for the hole
    final path = Path()..addOval(Rect.fromCircle(center: holePosition, radius: holeRadius));

    // Clip the hole
    canvas.clipPath(path, doAntiAlias: true);

    // Clear the hole area
    canvas.drawRect(
      Rect.fromCircle(center: holePosition, radius: holeRadius),
      Paint()..blendMode = BlendMode.clear,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
