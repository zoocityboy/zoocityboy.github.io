// ignore_for_file: camel_case_types

// Do not import `dart:io` here: web builds don't support it.

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';

Map<String, dynamic> asStringMap(Object? value) {
  if (value is Map) {
    return value.map((Object? key, Object? val) => MapEntry(key.toString(), val));
  }
  return <String, dynamic>{};
}

Map<String, dynamic> pageMeta(Page page) {
  return asStringMap(page.data['page']);
}

// `BASE_HREF` should be provided at compile time with `--dart-define=BASE_HREF=/docs/`
// Fallback is `/` (root).
const String baseHrefValue = String.fromEnvironment('BASE_HREF', defaultValue: '/');

/// Prefix a path with the configured `BASE_HREF`.
///
/// Examples:
/// - `prefixPath('/')` -> `/docs/`
/// - `prefixPath('/posts')` -> `/docs/posts`
String prefixPath(String path) {
  // Only prefix paths that begin with a leading slash. Leave external URLs
  // and fragment/relative paths untouched.
  if (!path.startsWith('/')) return path;
  final base = baseHrefValue;
  if (base == '/' || base.isEmpty) return path;
  final p = path == '/' ? '' : path.substring(1);
  if (base.endsWith('/')) return '$base$p';
  return '$base/$p';
}

final class baseHref extends StatelessComponent {
  const baseHref({super.key});

  @override
  Component build(BuildContext context) {
    return Component.element(
      tag: 'base',
      attributes: {'href': baseHrefValue},
    );
  }
}

abstract class MyBaseLayout extends PageLayoutBase {
  const MyBaseLayout();

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
    yield const baseHref();
    yield meta(name: 'viewport', content: 'width=device-width, initial-scale=1');
    yield link(href: prefixPath('/styles.css'), rel: 'stylesheet', id: 'site-styles');
  }
}
