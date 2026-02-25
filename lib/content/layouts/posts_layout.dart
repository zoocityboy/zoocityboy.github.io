import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/content/components/content_views.dart';
import 'package:site/content/layouts/site_layouts.dart';

class PostsLayout extends MyBaseLayout {
  const PostsLayout();

  @override
  Pattern get name => 'posts';

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
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
