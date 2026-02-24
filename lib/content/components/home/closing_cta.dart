import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ClosingCta extends StatelessComponent {
  const ClosingCta({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'pb-card px-6 py-10 md:px-8', [
      div(classes: 'flex flex-col gap-6 md:flex-row md:items-center md:justify-between', [
        div(classes: 'space-y-2', [
          h2(classes: 'text-2xl font-semibold tracking-tight md:text-3xl', [.text('Give your agent better context.')]),
          p(classes: 'text-sm text-muted-foreground md:text-base', [
            .text('Get better code and fewer hallucinations with a reusable skill-first setup.'),
          ]),
        ]),
        div(classes: 'flex flex-wrap gap-3', [
          a(href: '#directory', classes: 'pb-button-primary', [.text('Browse skills')]),
          a(href: '#faq', classes: 'pb-button-secondary', [.text('Browse MCP servers')]),
        ]),
      ]),
    ]);
  }
}
