// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:jaspr_content/components/callout.dart' as _callout;
import 'package:jaspr_content/components/theme_toggle.dart' as _theme_toggle;
import 'package:jaspr_content_snippets/internal/client.dart' as _client;
import 'package:site/content/nav_component.dart' as _nav_component;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _theme_toggle.ThemeToggle: ClientTarget<_theme_toggle.ThemeToggle>(
      'jaspr_content:theme_toggle',
    ),
    _client.CodeBlockCopyButton: ClientTarget<_client.CodeBlockCopyButton>(
      'jaspr_content_snippets:client',
    ),
    _nav_component.NavComponent: ClientTarget<_nav_component.NavComponent>(
      'nav_component',
    ),
  },
  styles: () => [
    ..._callout.Callout.styles,
    ..._theme_toggle.ThemeToggleState.styles,
  ],
);
