import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/components/theme_toggle.dart';
import '../layouts/site_layouts.dart';

@client
class NavComponent extends StatefulComponent {
  const NavComponent({super.key});

  @override
  State createState() => _NavComponentState();
}

class _NavComponentState extends State<NavComponent> {
  bool _open = false;

  bool _isActive(BuildContext context, String href) {
    final ph = prefixPath(href);
    return context.url == ph || context.url.startsWith('$ph/');
  }

  void _toggle() => setState(() => _open = !_open);

  void _close() => setState(() => _open = false);

  @override
  Component build(BuildContext context) {
    String linkClass(String href, [String base = 'transition-colors hover:text-foreground']) {
      return '$base ${_isActive(context, href) ? 'text-foreground' : 'text-muted-foreground'}';
    }

    final mobileMenuBase = 'md:hidden border-t border-border bg-background';
    final mobileMenuClasses = _open ? '$mobileMenuBase block' : '$mobileMenuBase hidden';

    return header(
      classes: 'sticky top-0 z-50 border-b border-border bg-background',
      [
        // Main header row
        div(classes: 'mx-auto flex h-16 w-full max-w-5xl items-center justify-between px-6 md:px-8', [
          // Brand
          a(
            href: prefixPath('/'),
            classes: linkClass('/', 'text-sm font-semibold tracking-tight'),
            [.text('zoocityboy')],
          ),

          // Desktop nav
          nav(
            classes: 'hidden items-center gap-5 text-xs font-semibold uppercase tracking-[0.12em] md:flex',
            [
              a(href: prefixPath('/posts'), classes: linkClass('/posts'), [.text('Posts')]),
              a(href: prefixPath('/packages'), classes: linkClass('/packages'), [.text('Packages')]),
              a(
                href: 'https://github.com/zoocityboy',
                attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
                classes: 'pb-button-secondary px-4 py-2',
                [.text('GitHub')],
              ),
              ThemeToggle(),
            ],
          ),

          // Mobile controls
          div(classes: 'flex items-center gap-2 md:hidden', [
            ThemeToggle(),
            button(
              attributes: {
                'type': 'button',
                'aria-expanded': _open ? 'true' : 'false',
                'aria-label': 'Toggle menu',
                'aria-controls': 'mobile-nav-menu',
              },
              classes: 'inline-flex h-9 w-9 items-center justify-center rounded-md border border-border bg-card p-1',
              onClick: _toggle,
              [
                // Simple hamburger / X icon using spans
                if (!_open)
                  div(classes: 'space-y-1', [
                    span(classes: 'block h-0.5 w-5 bg-foreground', []),
                    span(classes: 'block h-0.5 w-5 bg-foreground', []),
                    span(classes: 'block h-0.5 w-5 bg-foreground', []),
                  ])
                else
                  div(classes: 'leading-none', [
                    span(classes: 'block h-0.5 w-5 rotate-45 origin-center bg-foreground', []),
                    span(classes: 'block h-0.5 w-5 -rotate-45 -mt-0.5 origin-center bg-foreground', []),
                  ]),
              ],
            ),
          ]),
        ]),

        // Mobile menu toggles visibility on small screens.
        div(
          id: 'mobile-nav-menu',
          attributes: {'aria-hidden': _open ? 'false' : 'true'},
          classes: mobileMenuClasses,
          [
            div(classes: 'mx-auto max-w-5xl px-6 py-4', [
              nav(classes: 'flex flex-col gap-3 text-sm font-semibold uppercase', [
                a(
                  href: prefixPath('/posts'),
                  classes: '${linkClass('/posts')} py-2',
                  onClick: _close,
                  [.text('Posts')],
                ),
                a(
                  href: prefixPath('/packages'),
                  classes: '${linkClass('/packages')} py-2',
                  onClick: _close,
                  [.text('Packages')],
                ),
                a(
                  href: 'https://github.com/zoocityboy',
                  classes: 'py-2',
                  attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
                  onClick: _close,
                  [.text('GitHub')],
                ),
              ]),
            ]),
          ],
        ),
      ],
    );
  }
}
