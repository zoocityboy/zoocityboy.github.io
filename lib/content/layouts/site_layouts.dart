// ignore_for_file: camel_case_types

import 'dart:io';

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
