import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zoocityboy_web/presentation/title_view.dart';

import '../painter/circle_painter.dart';
import 'background_mash.dart';
import 'footer_widget.dart';

class MainHeroWidget extends StatelessWidget {
  const MainHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CircleView(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Positioned.fill(child: LayoutBuilder(builder: (context, constraints) {
          //   return CustomPaint(
          //     painter: CirclePainter(
          //       radius: constraints.maxWidth / 3,
          //       color: Colors.white.withOpacity(.1),
          //       strokeWidth: 2,
          //     ),
          //   );
          // })),
          Center(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: 300,
              height: 300,
              child: const MeshGradientWidget(),
            ).animate().fadeIn(
                  delay: 1.seconds,
                  duration: 1.5.seconds,
                  curve: Curves.easeInCubic,
                ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: RepaintBoundary(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    Text(
                      'Current year?',
                      style: textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      DateTime.now().year.toString(),
                      style: textTheme.displayLarge,
                    ),
                  ]
                      .animate()
                      .slideY(
                          begin: 0, end: -.5, delay: const Duration(seconds: 1), duration: const Duration(seconds: 2))
                      .blur(
                        begin: const Offset(5, 5),
                        end: Offset.zero,
                      )
                      .fadeIn(
                        curve: Curves.easeInCubic,
                        duration: kThemeAnimationDuration,
                      ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: const FooterWidget()
                .animate()
                .slideY(
                  begin: 1,
                  end: 0,
                  duration: kThemeAnimationDuration,
                  delay: 1.5.seconds,
                )
                .fade(
                  begin: 0,
                  end: .5,
                  curve: Curves.easeInCubic,
                  duration: kThemeAnimationDuration,
                ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            child: TitleView(),
          ),
        ],
      ),
    );
  }
}
