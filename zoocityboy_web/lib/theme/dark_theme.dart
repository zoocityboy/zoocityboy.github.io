import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// final kDefaultDarkTheme = ThemeData.from(
//   colorScheme: const ColorScheme.dark(
//     primary: kPrimaryColor, // const Color(0xff6ae792),
//     secondary: kSecondaryColor, // Colors.greenAccent.shade100,
//     tertiary: kTertiaryColor,
//     background: kDarkBlueBackground,
//     surface: kDarkBlueSurface,
//     outline: Colors.white10,
//     outlineVariant: Colors.white12,
//   ),
//   useMaterial3: true,
//   textTheme: GoogleFonts.jetBrainsMonoTextTheme(ThemeData.dark().textTheme),
// );
// SystemUiOverlayStyle kDarkSystemUiOverlayStyle = SystemUiOverlayStyle(
//   statusBarColor: Colors.transparent,
//   systemNavigationBarColor: kDefaultDarkTheme.colorScheme.surface,
//   statusBarBrightness: Brightness.dark,
// );
// SystemUiOverlayStyle kDarkEntrySystemUiOverlayStyle = SystemUiOverlayStyle(
//   statusBarColor: kDefaultDarkTheme.colorScheme.background.withAlpha(16),
//   systemNavigationBarColor:
//       kDefaultDarkTheme.colorScheme.background.withAlpha(16),
//   statusBarBrightness: Brightness.dark,
// );
// final kDarkTheme = kDefaultDarkTheme.copyWith(
//   visualDensity: VisualDensity.adaptivePlatformDensity,
//   appBarTheme: kDefaultDarkTheme.appBarTheme.copyWith(
//     systemOverlayStyle: kDarkSystemUiOverlayStyle,
//     surfaceTintColor: kCardOverlay,
//     backgroundColor: kDarkBlueBackground,
//   ),
//   navigationRailTheme: NavigationRailThemeData(
//     // backgroundColor: Colors.transparent,
//     elevation: 0,
//     selectedIconTheme: const IconThemeData(
//       color: Colors.black87,
//     ),
//     unselectedIconTheme: IconThemeData(
//       color: Colors.grey.shade500,
//     ),
//   ),
//   navigationBarTheme: kDefaultDarkTheme.navigationBarTheme.copyWith(
//     elevation: 0,
//     backgroundColor: kDefaultDarkTheme.colorScheme.surface,
//   ),
//   pageTransitionsTheme: const PageTransitionsTheme(
//     builders: <TargetPlatform, PageTransitionsBuilder>{
//       TargetPlatform.android: ZoomPageTransitionsBuilder(),
//       TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
//       TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
//       TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
//       TargetPlatform.linux: ZoomPageTransitionsBuilder(),
//     },
//   ),
// );
// final kDefaultLightTheme = ThemeData.from(
//   colorScheme: ColorScheme.light(
//     primary: kPrimaryColor, // const Color(0xff6ae792),
//     secondary: kSecondaryColor, // Colors.greenAccent.shade100,
//     tertiary: kTertiaryColor,
//     background: kLightBlueBackground,
//     surface: kLightBlueSurface,
//   ),
//   useMaterial3: true,
//   textTheme: GoogleFonts.jetBrainsMonoTextTheme(ThemeData.light().textTheme),
// );
// final kLightTheme = kDefaultLightTheme.copyWith();

ColorScheme darkScheme() {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffffffff),
    surfaceTint: Color(0xffc6c6c7),
    onPrimary: Color(0xff2f3131),
    primaryContainer: Color(0xffd4d4d4),
    onPrimaryContainer: Color(0xff3e4040),
    secondary: Color(0xffc8c6c6),
    onSecondary: Color(0xff303030),
    secondaryContainer: Color(0xff3f3f3f),
    onSecondaryContainer: Color(0xffd5d4d3),
    tertiary: Color(0xfff50057), // Color(0xffffffff),
    onTertiary: Color(0xffd4d4d4), // Color(0xff2f3131),
    tertiaryContainer: Color(0xffd4d4d4),
    onTertiaryContainer: Color(0xff3e4040),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff141313),
    onSurface: Color(0xffe5e2e1),
    onSurfaceVariant: Color(0xffc4c7c8),
    outline: Color(0xff8e9192),
    outlineVariant: Color(0xff444748),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffe5e2e1),
    inversePrimary: Color(0xff5d5f5f),
    primaryFixed: Color(0xffe2e2e2),
    onPrimaryFixed: Color(0xff1a1c1c),
    primaryFixedDim: Color(0xffc6c6c7),
    onPrimaryFixedVariant: Color(0xff454747),
    secondaryFixed: Color(0xffe4e2e2),
    onSecondaryFixed: Color(0xff1b1c1c),
    secondaryFixedDim: Color(0xffc8c6c6),
    onSecondaryFixedVariant: Color(0xff474747),
    tertiaryFixed: Color(0xffe2e2e2),
    onTertiaryFixed: Color(0xff1a1c1c),
    tertiaryFixedDim: Color(0xffc6c6c7),
    onTertiaryFixedVariant: Color(0xff454747),
    surfaceDim: Color(0xff141313),
    surfaceBright: Color(0xff3a3939),
    surfaceContainerLowest: Color(0xff0e0e0e),
    surfaceContainerLow: Color(0xff1c1b1b),
    surfaceContainer: Color(0xff201f1f),
    surfaceContainerHigh: Color(0xff2a2a2a),
    surfaceContainerHighest: Color(0xff353434),
  );
}

ColorScheme lightScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff5d5f5f),
    surfaceTint: Color(0xff5d5f5f),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffffffff),
    onPrimaryContainer: Color(0xff575859),
    secondary: Color(0xff3f3d56), // Color(0xff5e5e5e),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffe8e6e6),
    onSecondaryContainer: Color(0xff4a4a4a),
    tertiary: Color.fromARGB(255, 25, 0, 245), // Color(0xff5d5f5f),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffffffff),
    onTertiaryContainer: Color(0xff575859),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410002),
    surface: Color(0xfffcf8f8),
    onSurface: Color(0xff1c1b1b),
    onSurfaceVariant: Color(0xff444748),
    outline: Color(0xff747878),
    outlineVariant: Color(0xffc4c7c8),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff313030),
    inversePrimary: Color(0xffc6c6c7),
    primaryFixed: Color(0xffe2e2e2),
    onPrimaryFixed: Color(0xff1a1c1c),
    primaryFixedDim: Color(0xffc6c6c7),
    onPrimaryFixedVariant: Color(0xff454747),
    secondaryFixed: Color(0xffe4e2e2),
    onSecondaryFixed: Color(0xff1b1c1c),
    secondaryFixedDim: Color(0xffc8c6c6),
    onSecondaryFixedVariant: Color(0xff474747),
    tertiaryFixed: Color(0xffe2e2e2),
    onTertiaryFixed: Color(0xff1a1c1c),
    tertiaryFixedDim: Color(0xffc6c6c7),
    onTertiaryFixedVariant: Color(0xff454747),
    surfaceDim: Color(0xffddd9d9),
    surfaceBright: Color(0xfffcf8f8),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff6f3f2),
    surfaceContainer: Color(0xfff1edec),
    surfaceContainerHigh: Color(0xffebe7e7),
    surfaceContainerHighest: Color(0xffe5e2e1),
  );
}

ThemeData darkTheme() {
  return ThemeData.from(
    colorScheme: darkScheme(),
    useMaterial3: true,
    textTheme: createTextTheme(ThemeData.dark().textTheme, 'DM Sans', 'Lufga'),
  ).copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData lightTheme() {
  return ThemeData.from(
    colorScheme: lightScheme(),
    useMaterial3: true,
    textTheme: createTextTheme(ThemeData.light().textTheme, 'DM Sans', 'Lufga'),
  ).copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme createTextTheme(TextTheme baseTextTheme, String bodyFontString, String displayFontString) {
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme("DM Sans", baseTextTheme);
  TextTheme displayTextTheme = baseTextTheme.apply(
    fontFamily: 'Lufga',
  );
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
