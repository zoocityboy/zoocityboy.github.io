// ignore_for_file: camel_case_types

import 'dart:io';

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

final String baseHrefValue =
    Platform.environment['BASE_HREF'] ?? String.fromEnvironment('BASE_HREF', defaultValue: '/');

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
    yield link(href: '/styles.css', rel: 'stylesheet', id: 'site-styles');
  }
}
