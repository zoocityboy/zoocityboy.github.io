import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';

class RecentPostsSection extends StatelessComponent {
  const RecentPostsSection({super.key});

  @override
  Component build(BuildContext context) {
    final List<Page> posts = context.pages.where((Page page) {
      final Object? p = page.data['page'];
      final Map<String, dynamic> meta = p is Map ? p.map((k, v) => MapEntry(k.toString(), v)) : <String, dynamic>{};
      final bool isPost = meta['type']?.toString() == 'post';
      final bool inPostsDir = page.path.startsWith('posts/');
      return isPost || inPostsDir;
    }).toList();

    // ignore: avoid_types_as_parameter_names
    posts.sort((a, b) {
      final DateTime da = DateTime.tryParse((a.data['page'] is Map ? (a.data['page'] as Map)['date']?.toString() : null) ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
      final DateTime db = DateTime.tryParse((b.data['page'] is Map ? (b.data['page'] as Map)['date']?.toString() : null) ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
      return db.compareTo(da);
    });

    final recent = posts.take(3).toList();

    return section(classes: 'space-y-8 pb-20', [
      div(classes: 'flex items-center justify-between', [
        h2(classes: 'text-3xl font-semibold tracking-tight md:text-4xl', [.text('Recent posts')]),
        a(href: '/posts', classes: 'text-sm font-semibold transition-colors hover:text-foreground', [.text('All')]),
      ]),
      div(classes: 'grid gap-3 md:grid-cols-3', [
        if (recent.isEmpty)
          div(classes: 'pb-card p-6', [p(classes: 'text-sm text-muted-foreground', [.text('No posts yet.')])])
        else ...recent.map((Page post) {
          final Object? postData = post.data['page'];
          final Map<String, dynamic> meta = postData is Map ? postData.map((k, v) => MapEntry(k.toString(), v)) : <String, dynamic>{};
          final String title = meta['title']?.toString() ?? post.path;
          final String description = meta['description']?.toString() ?? '';
          final String date = meta['date']?.toString() ?? '';

          return article(classes: 'pb-card p-6', [
            p(classes: 'pb-kicker', [Component.text(date.isNotEmpty ? date : '')]),
            h3(classes: 'mt-3 text-xl font-semibold tracking-tight text-card-foreground', [
              a(href: post.url, classes: 'transition-colors hover:text-foreground', [Component.text(title)]),
            ]),
            if (description.isNotEmpty) p(classes: 'mt-3 text-sm leading-6 text-muted-foreground', [Component.text(description)]),
          ]);
        })
      ]),
    ]);
  }
}
