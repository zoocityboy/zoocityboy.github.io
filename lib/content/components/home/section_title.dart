import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../layouts/site_layouts.dart';

class SectionTitle extends StatelessComponent {
  const SectionTitle({
    required this.title,
    this.actionLabel,
    this.actionHref,
    super.key,
  });

  final String title;
  final String? actionLabel;
  final String? actionHref;

  @override
  Component build(BuildContext context) {
    return div(classes: 'flex items-center justify-between', [
      h2(classes: 'text-3xl font-semibold tracking-tight md:text-4xl', [.text(title)]),
      if (actionLabel != null && actionHref != null)
        a(
          href: prefixPath(actionHref!),
          classes: 'text-sm font-semibold transition-colors hover:text-foreground',
          [.text(actionLabel!)],
        ),
    ]);
  }
}
