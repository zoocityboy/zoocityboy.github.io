import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zoocityboy_web/extensions.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key});
  static const double size = 48.0;
  int cacheSize(BuildContext context) => (MediaQuery.of(context).devicePixelRatio * size).toInt();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dart & Flutter developer',
            style: textTheme.bodyMedium,
          )
              .animate()
              .slideY(
                  curve: Curves.easeInCubic, begin: -1, end: 0, delay: 1.5.seconds, duration: kThemeAnimationDuration)
              .fade(
                begin: 0,
                end: .4,
                curve: Curves.easeInCubic,
                duration: kThemeAnimationDuration,
                delay: 1.5.seconds,
              ),
          SizedBox(
            height: size,
            child: Image.asset(
              context.isDark ? 'res/zoocityboy_light.png' : 'res/zoocityboy_dark.png',
              height: size,
              fit: BoxFit.fitHeight,
              cacheHeight: cacheSize(context),
            )
                .animate()
                .fadeIn(
                  duration: kThemeAnimationDuration * 1.2,
                  curve: Curves.easeInCubic,
                  delay: 2.seconds,
                )
                .scale(
                  curve: Curves.easeInCubic,
                  duration: kThemeAnimationDuration * 1.2,
                  begin: const Offset(0.9, 0.9),
                  delay: 2.seconds,
                )
                .rotate(
                  duration: kThemeAnimationDuration * 1.2,
                  begin: 1.01,
                  end: 0.995,
                  alignment: Alignment.center,
                  delay: 2.seconds,
                ),
          ),
        ],
      ),
    );
  }
}
