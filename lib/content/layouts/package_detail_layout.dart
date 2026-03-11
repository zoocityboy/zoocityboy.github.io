import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/content/components/content_views.dart';
import 'package:site/content/layouts/site_layouts.dart';

class PackageDetailLayout extends MyBaseLayout {
  const PackageDetailLayout();

  @override
  Pattern get name => 'package_detail';

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
    yield codeBlockLanguageLabelScript();
  }

  @override
  Component buildBody(Page page, Component child) {
    final Map<String, dynamic> meta = pageMeta(page);
    final String slug = meta['slug']?.toString() ?? '';

    return SiteFrame(
      activePath: '/packages',
      title: meta['title']?.toString() ?? 'Package',
      subtitle: meta['description']?.toString(),
      child: div(classes: 'space-y-8', [
        PackageDetailView(slug: slug),
        if (page.content.trim().isNotEmpty) ...[
          article(classes: 'border border-border bg-card p-6 md:p-8', [
            div(classes: 'prose prose-sm max-w-none text-foreground', [child]),
          ]),
        ],
      ]),
    );
  }
}
