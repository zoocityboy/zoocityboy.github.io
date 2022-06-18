import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final kDefaultDarkTheme = ThemeData.from(
  colorScheme: const ColorScheme.dark(
    primary: kPrimaryColor, // const Color(0xff6ae792),
    secondary: kSecondaryColor, // Colors.greenAccent.shade100,
    tertiary: kTertiaryColor,
    background: kDarkBlueBackground,
    surface: kDarkBlueSurface,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.dmSansTextTheme(ThemeData.dark().textTheme),
);
SystemUiOverlayStyle kDarkSystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: kDefaultDarkTheme.colorScheme.surface,
  statusBarBrightness: Brightness.dark,
);
SystemUiOverlayStyle kDarkEntrySystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: kDefaultDarkTheme.colorScheme.background.withAlpha(16),
  systemNavigationBarColor:
      kDefaultDarkTheme.colorScheme.background.withAlpha(16),
  statusBarBrightness: Brightness.dark,
);
final kDarkTheme = kDefaultDarkTheme.copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: kDefaultDarkTheme.appBarTheme.copyWith(
    systemOverlayStyle: kDarkSystemUiOverlayStyle,
  ),
  navigationRailTheme: NavigationRailThemeData(
    // backgroundColor: Colors.transparent,
    elevation: 0,
    selectedIconTheme: const IconThemeData(
      color: Colors.black87,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey.shade500,
    ),
  ),
  navigationBarTheme: kDefaultDarkTheme.navigationBarTheme.copyWith(
    elevation: 0,
    backgroundColor: kDefaultDarkTheme.colorScheme.surface,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
    },
  ),
);
