import 'package:jaspr/jaspr.dart';

const baseHrefValue = String.fromEnvironment('BASE_HREF', defaultValue: '/');

final class BaseHrefTag extends StatelessComponent {
  const BaseHrefTag({super.key});

  @override
  Component build(BuildContext context) {
    return Component.element(
      tag: 'base',
      attributes: {'href': baseHrefValue},
    );
  }
}
