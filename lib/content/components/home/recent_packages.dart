import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/content/components/home/section_title.dart';

import '../../layouts/site_layouts.dart';

class RecentPackagesSection extends StatelessComponent {
  const RecentPackagesSection({super.key});

  @override
  Component build(BuildContext context) {
    final Object? raw = context.page.data['packages'];
    final Object? source = raw is Map ? (raw['items'] ?? raw['packages'] ?? raw) : raw;
    final List items = source is List ? source : <dynamic>[];

    final List<Map<String, dynamic>> packages = items
        .whereType<Object>()
        .map((e) => e is Map ? e.map((k, v) => MapEntry(k.toString(), v)) : <String, dynamic>{})
        .where((m) => m.isNotEmpty)
        .toList();

    final recent = packages.take(3).toList();

    return section(classes: 'space-y-8 pb-20', [
      const SectionTitle(title: 'Recent packages', actionLabel: 'All', actionHref: '/packages'),
      div(classes: 'grid gap-3 md:grid-cols-3', [
        if (recent.isEmpty)
          div(classes: 'pb-card p-6', [
            p(classes: 'text-sm text-muted-foreground', [.text('No packages configured yet.')]),
          ])
        else
          ...recent.map((pkg) {
            final String slug = pkg['slug']?.toString() ?? '';
            final String name = pkg['name']?.toString() ?? slug;
            final String summary = pkg['summary']?.toString() ?? '';

            return article(classes: 'pb-card p-6', [
              p(classes: 'pb-kicker', [.text('PKG')]),
              h3(classes: 'mt-3 text-xl font-semibold tracking-tight text-card-foreground', [.text(name)]),
              if (summary.isNotEmpty) p(classes: 'mt-3 text-sm leading-6 text-muted-foreground', [.text(summary)]),
              div(classes: 'mt-5 flex flex-wrap gap-2.5', [
                if (slug.isNotEmpty)
                  a(href: prefixPath('/packages/$slug'), classes: 'pb-button-primary', [.text('Details')]),
              ]),
            ]);
          }),
      ]),
    ]);
  }
}
