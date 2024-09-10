import 'package:flutter/material.dart';
import 'package:zoocityboy_web/theme/dark_theme.dart';

import 'presentation/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zoocityboy',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const MainScreen(),
    );
  }
}
