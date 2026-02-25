import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../layouts/site_layouts.dart';

class NavBreadcrumbs extends StatelessComponent {
  const NavBreadcrumbs({super.key, this.activePath = '', this.title});
  final String activePath;
  final String? title;

  @override
  Component build(BuildContext context) {
    return // Breadcrumbs
    nav(classes: 'text-sm text-muted-foreground py-2 space-y-6', [
      a(href: prefixPath('/'), classes: 'transition-colors hover:text-primary', [.text('Home')]),
      span(classes: 'px-2', [.text('/')]),
      // section link based on activePath
      a(
        href: prefixPath(activePath),
        classes: 'transition-colors hover:text-primary',
        [
          .text(
            activePath == '/posts' ? 'Blog' : (activePath == '/packages' ? 'Packages' : activePath.replaceAll('/', '')),
          ),
        ],
      ),
      if (title != null) ...[
        span(classes: 'px-2', [.text('/')]),
        span(classes: 'font-medium text-foreground', [.text(title!)]),
      ],
    ]);
  }
}
