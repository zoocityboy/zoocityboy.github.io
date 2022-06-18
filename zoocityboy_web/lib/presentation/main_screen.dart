import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'res/zoocityboy_light.png',
                  height: 96,
                  cacheHeight:
                      (MediaQuery.of(context).devicePixelRatio * 96).toInt(),
                ),
                const SizedBox(height: 16),
                Text(
                  'Fluter & dart for web',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Developed by 🦏 @zoocityboy',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
