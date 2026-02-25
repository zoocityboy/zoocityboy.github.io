import 'package:jaspr/jaspr.dart';

const baseHrefValue = String.fromEnvironment('BASE_HREF', defaultValue: '/');

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
