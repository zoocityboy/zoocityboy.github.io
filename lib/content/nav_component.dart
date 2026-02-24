import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class NavComponent extends StatelessComponent {
  const NavComponent({super.key});


  bool _isActive(BuildContext context, String href) {
    return context.url == href || context.url.startsWith('$href/');
  }

  @override
  Component build(BuildContext context) {
    String linkClass(String href, [String base = 'transition-colors hover:text-foreground']) {
      return '$base ${_isActive(context, href) ? 'text-foreground' : 'text-muted-foreground'}';
    }

    return header(
      classes: 'border-b border-border bg-background',
      [
        div(classes: 'mx-auto flex h-16 w-full max-w-5xl items-center justify-between px-6 md:px-8', [
          a(
            href: '/',
            classes: linkClass('/', 'text-sm font-semibold tracking-tight'),
            [.text('zoocityboy')],
          ),
          nav(
            classes: 'hidden items-center gap-5 text-xs font-semibold uppercase tracking-[0.12em] md:flex',
            [
              a(href: '/posts', classes: linkClass('/posts'), [.text('Posts')]),
              a(href: '/packages', classes: linkClass('/packages'), [.text('Packages')]),
              a(
                href: 'https://github.com/zoocityboy',
                classes: 'pb-button-secondary px-4 py-2',
                [.text('GitHub')],
              ),
              ThemeToggle(),
            ],
          ),
        ]),
      ],
    );
  }
}
