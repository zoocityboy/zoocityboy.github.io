import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class MeshGradientWidget extends StatefulWidget {
  const MeshGradientWidget({super.key});

  @override
  State<MeshGradientWidget> createState() => _MeshGradientWidgetState();
}

class _MeshGradientWidgetState extends State<MeshGradientWidget> {
  late final AnimatedMeshGradientController _controller;
  @override
  void initState() {
    _controller = AnimatedMeshGradientController();
    super.initState();
    _controller.start();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedMeshGradient(
      colors: [
        const Color(0xff270060).semiTransparent,
        const Color(0xff000b61).semiTransparent,
        const Color(0xff004e61).semiTransparent,
        const Color(0xff590061).semiTransparent,
      ],
      options: AnimatedMeshGradientOptions(),
      controller: _controller,
    );
  }
}

extension ColorExt on Color {
  Color get invertColor {
    final d = 1.0 - (0.299 * red + 0.587 * green + 0.114 * blue) / 255;
    return d < 0.5 ? Colors.black : Colors.white;
  }

  Color get semiTransparent => withOpacity(0.5);
}
