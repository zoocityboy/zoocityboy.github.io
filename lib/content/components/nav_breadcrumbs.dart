import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../layouts/site_layouts.dart';

class NavBreadcrumbs extends StatelessComponent {
  const NavBreadcrumbs({super.key, this.activePath = '', this.title});
  final String activePath;
  final String? title;

  String _sectionLabel() {
    if (activePath == '/posts') return 'Blog';
    if (activePath == '/packages') return 'Packages';
    final value = activePath.replaceAll('/', '').trim();
    return value.isEmpty ? 'Home' : value;
  }

  @override
  Component build(BuildContext context) {
    return nav(classes: 'flex flex-wrap items-center gap-2 py-2 text-sm text-muted-foreground', [
      a(href: prefixPath('/'), classes: 'transition-colors hover:text-primary', [.text('Home')]),
      span(classes: 'px-2', [.text('/')]),
      a(
        href: prefixPath(activePath),
        classes: 'transition-colors hover:text-primary',
        [.text(_sectionLabel())],
      ),
      if (title != null) ...[
        span(classes: 'px-2', [.text('/')]),
        span(classes: 'font-medium text-foreground', [.text(title!)]),
      ],
    ]);
  }
}
