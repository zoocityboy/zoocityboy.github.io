import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/content/components/content_views.dart';
import 'package:site/content/layouts/site_layouts.dart';

class PostsLayout extends PageLayoutBase {
  const PostsLayout();

  @override
  Pattern get name => 'posts';

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
    yield const baseHref();
    yield meta(name: 'viewport', content: 'width=device-width, initial-scale=1');
    yield link(href: '/styles.css', rel: 'stylesheet', id: 'site-styles');
    // yield script(
    //   content:
    //       r"(function(){try{fetch('/styles.css',{method:'HEAD'}).then(function(res){if(!res.ok){var l=document.getElementById('site-styles');if(l)l.href='styles.css';}}).catch(function(){var l=document.getElementById('site-styles');if(l)l.href='styles.css';});}catch(e){} })();",
    // );
  }

  @override
  Component buildBody(Page page, Component child) {
    return SiteFrame(
      activePath: '/posts',
      title: pageMeta(page)['title']?.toString() ?? 'Blog',
      subtitle: pageMeta(page)['description']?.toString(),
      child: div(classes: 'space-y-8', [
        child,
        const BlogPostListView(),
      ]),
    );
  }
}
