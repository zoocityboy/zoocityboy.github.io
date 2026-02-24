import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class NavComponent extends StatelessComponent {
  const NavComponent({super.key});

  @override
  Component build(BuildContext context) {
    return header(
      classes: 'border-b border-border bg-background',
      [
        div(classes: 'mx-auto flex h-16 w-full max-w-5xl items-center justify-between px-6 md:px-8', [
          a(
            href: '/',
            classes: 'text-sm font-semibold tracking-tight text-foreground',
            [.text('zoocityboy')],
          ),
          nav(
            classes:
                'hidden items-center gap-5 text-xs font-semibold uppercase tracking-[0.12em] text-muted-foreground md:flex',
            [
              a(href: '/posts', classes: 'transition-colors hover:text-foreground', [.text('Posts')]),
              a(href: '/packages', classes: 'transition-colors hover:text-foreground', [.text('Packages')]),
              a(
                href: 'https://github.com/zoocityboy/zoocityboy.github.io',
                classes: 'pb-button-secondary px-4 py-2',
                [.text('GitHub')],
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
