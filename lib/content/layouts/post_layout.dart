import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/content/components/content_views.dart';
import 'package:site/content/layouts/site_layouts.dart';

class PostLayout extends MyBaseLayout {
  const PostLayout();

  @override
  Pattern get name => 'post';

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
      activePath: '/posts',
      title: meta['title']?.toString() ?? 'Blog Post',
      subtitle: meta['description']?.toString(),
      child: slug.isNotEmpty
          ? PostDetailView(slug: slug)
          : article([
              if (meta['date'] != null) ...[
                p(classes: 'text-xs font-semibold uppercase tracking-[0.12em] text-muted-foreground', [
                  .text(meta['date'].toString()),
                ]),
                div(classes: 'mt-4 border-t border-border', []),
              ],
              div(classes: 'prose prose-sm mt-6 max-w-none text-foreground', [child]),
            ]),
    );
  }
}
