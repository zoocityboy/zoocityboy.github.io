import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(maxWidth: 1024, minHeight: 120, maxHeight: 300),
      child: const GridTileBar(
        leading: Icon(Ionicons.at_circle),
        title: Text('Ionic icons'),
        subtitle: Text('Subtitle'),
      ),
    );
  }
}
