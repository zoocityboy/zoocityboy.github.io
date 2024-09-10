import 'package:flutter/material.dart';
import 'package:zoocityboy_web/presentation/hero_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainHeroWidget(),
    );
  }
}
