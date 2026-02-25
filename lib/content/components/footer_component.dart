import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../layouts/site_layouts.dart';

class FooterComponent extends StatelessComponent {
  const FooterComponent({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'border-t border-border bg-background', [
      div(
        classes:
            'mx-auto flex w-full max-w-5xl flex-col gap-4 px-6 py-8 text-sm text-muted-foreground md:flex-row md:items-center md:justify-between md:px-8',
        [
          p([.text('created by zoocityboy')]),
          div(classes: 'flex flex-wrap gap-4', [
            a(href: prefixPath('/'), classes: 'transition-colors hover:text-foreground', [.text('Home')]),
            a(href: prefixPath('/posts'), classes: 'transition-colors hover:text-foreground', [.text('Blog')]),
            a(href: prefixPath('/packages'), classes: 'transition-colors hover:text-foreground', [.text('Packages')]),
          ]),
        ],
      ),
    ]);
  }
}
