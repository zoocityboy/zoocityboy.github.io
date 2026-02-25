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

    // Add small script to annotate code blocks with data-lang for label display
    yield script(
      content: r"""
          (function(){
            function setLangLabels(){
              document.querySelectorAll('.code-block').forEach(function(cb){
                var code = cb.querySelector('code[class*="language-"]');
                var lang = 'code';
                if(code){
                  var m = code.className.match(/language-([^\s]+)/);
                  if(m) lang = m[1];
                }
                cb.setAttribute('data-lang', lang.toUpperCase());
              });
            }
            if(document.readyState === 'loading'){
              document.addEventListener('DOMContentLoaded', setLangLabels);
            } else { setLangLabels(); }
          })();
        """,
    );
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
          : article(classes: 'border border-border bg-card p-6 md:p-8', [
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
