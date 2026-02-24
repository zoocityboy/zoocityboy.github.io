import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/content/footer_component.dart';
import 'package:site/content/nav_component.dart';

Map<String, dynamic> _asStringMap(Object? value) {
  if (value is Map) {
    return value.map((Object? key, Object? val) => MapEntry(key.toString(), val));
  }
  return <String, dynamic>{};
}

Map<String, dynamic> _pageMeta(Page page) {
  return _asStringMap(page.data['page']);
}

List<Map<String, dynamic>> _postItemsFromData(Object? rawPostsData) {
  final Object? source = rawPostsData is Map ? rawPostsData['items'] ?? rawPostsData['posts'] : rawPostsData;

  if (source is! List) {
    return <Map<String, dynamic>>[];
  }

  return source
      .whereType<Object>()
      .map((Object post) => _asStringMap(post))
      .where((Map<String, dynamic> post) => post.isNotEmpty)
      .toList();
}

List<Map<String, dynamic>> _packageItemsFromData(Object? rawPackagesData) {
  final Object? source = rawPackagesData is Map
      ? rawPackagesData['items'] ?? rawPackagesData['packages']
      : rawPackagesData;

  if (source is! List) {
    return <Map<String, dynamic>>[];
  }

  return source
      .whereType<Object>()
      .map((Object package) => _asStringMap(package))
      .where((Map<String, dynamic> package) => package.isNotEmpty)
      .toList();
}

class SiteFrame extends StatelessComponent {
  const SiteFrame({
    required this.activePath,
    required this.child,
    this.title,
    this.subtitle,
    super.key,
  });

  final String activePath;
  final String? title;
  final String? subtitle;
  final Component child;

  bool _isActive(String href) {
    return activePath == href || activePath.startsWith('$href/');
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'site-frame', [
      NavComponent(),
      main_(classes: 'mx-auto w-full max-w-5xl px-6 pb-24 pt-10 md:px-8', [
        if (title != null) ...[
          // Breadcrumbs
          nav(classes: 'text-sm text-muted-foreground py-2', [
            a(href: '/', classes: 'transition-colors hover:text-primary', [.text('Home')]),
            span(classes: 'px-2', [.text('/')]),
            // section link based on activePath
            a(
              href: activePath,
              classes: 'transition-colors hover:text-primary',
              [
                .text(
                  activePath == '/posts'
                      ? 'Blog'
                      : (activePath == '/packages' ? 'Packages' : activePath.replaceAll('/', '')),
                ),
              ],
            ),
            if (title != null) ...[
              span(classes: 'px-2', [.text('/')]),
              span(classes: 'font-medium text-foreground', [.text(title!)]),
            ],
          ]),
          h1(classes: 'text-4xl font-semibold tracking-tighter md:text-5xl', [.text(title!)]),
          if (subtitle != null) ...[
            p(classes: 'mt-4 max-w-[64ch] text-sm leading-7 text-muted-foreground md:text-base', [
              .text(subtitle!),
            ]),
          ],
          div(classes: 'mt-8 border-t border-border', []),
        ],
        div(classes: title != null ? 'mt-8' : '', [child]),
      ]),
      FooterComponent(),
    ]);
  }
}

class BlogPostListView extends StatelessComponent {
  const BlogPostListView({super.key});

  @override
  Component build(BuildContext context) {
    // Use YAML-driven posts from `content/_data/posts.yaml` (available as `page.data['posts']`)
    final List<Map<String, dynamic>> yamlPosts = _postItemsFromData(context.page.data['posts']);

    if (yamlPosts.isEmpty) {
      return div(classes: 'border border-border bg-card p-6', [
        p(classes: 'text-sm text-muted-foreground', [.text('No blog posts published yet.')]),
      ]);
    }

    yamlPosts.sort((a, b) {
      final DateTime dateA = DateTime.tryParse(a['date']?.toString() ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
      final DateTime dateB = DateTime.tryParse(b['date']?.toString() ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
      return dateB.compareTo(dateA);
    });

    return div(classes: 'grid gap-3', [
      ...yamlPosts.map((Map<String, dynamic> post) {
        final String slug = post['slug']?.toString() ?? '';
        final String title = post['name']?.toString() ?? post['title']?.toString() ?? slug;
        final String description = post['summary']?.toString() ?? post['description']?.toString() ?? '';
        final String date = post['date']?.toString() ?? '';
        final String url = post['url']?.toString() ?? (slug.isNotEmpty ? '/posts/$slug' : '#');

        return article(classes: 'border border-border bg-card p-6', [
          p(classes: 'text-xs font-semibold uppercase tracking-[0.12em] text-muted-foreground', [.text(date)]),
          h2(classes: 'mt-3 text-2xl font-semibold tracking-tight text-card-foreground', [
            a(href: url, classes: 'transition-colors hover:text-primary', [.text(title)]),
          ]),
          if (description.isNotEmpty) ...[
            p(classes: 'mt-3 text-sm leading-6 text-muted-foreground', [.text(description)]),
          ],
          a(
            href: url,
            classes:
                'mt-5 inline-flex items-center border border-border bg-card px-4 py-2 text-sm font-semibold text-foreground transition-colors hover:bg-accent',
            [.text('Read post')],
          ),
        ]);
      }),
    ]);
  }
}

class PackagesListView extends StatelessComponent {
  const PackagesListView({super.key});

  @override
  Component build(BuildContext context) {
    final List<Map<String, dynamic>> packages = _packageItemsFromData(context.page.data['packages']);

    if (packages.isEmpty) {
      return div(classes: 'border border-border bg-card p-6', [
        p(classes: 'text-sm text-muted-foreground', [.text('No packages configured yet.')]),
      ]);
    }

    return div(classes: 'grid gap-3 md:grid-cols-2', [
      ...packages.map((Map<String, dynamic> package) {
        final String slug = package['slug']?.toString() ?? '';
        final String name = package['name']?.toString() ?? slug;
        final String summary = package['summary']?.toString() ?? '';
        final String pubUrl = package['url']?.toString() ?? '';

        return article(classes: 'border border-border bg-card p-6', [
          h2(classes: 'text-xl font-semibold tracking-tight text-card-foreground', [.text(name)]),
          if (summary.isNotEmpty) ...[
            p(classes: 'mt-3 text-sm leading-6 text-muted-foreground', [.text(summary)]),
          ],
          div(classes: 'mt-5 flex flex-wrap gap-2.5', [
            if (slug.isNotEmpty) ...[
              a(
                href: '/packages/$slug',
                classes:
                    'inline-flex items-center bg-primary px-4 py-2 text-sm font-semibold text-primary-foreground transition-opacity hover:opacity-90',
                [.text('Details')],
              ),
            ],
            if (pubUrl.isNotEmpty) ...[
              a(
                href: pubUrl,
                classes:
                    'inline-flex items-center border border-border bg-card px-4 py-2 text-sm font-semibold text-foreground transition-colors hover:bg-accent',
                [.text('pub.dev')],
              ),
            ],
          ]),
        ]);
      }),
    ]);
  }
}

class PackageDetailView extends StatelessComponent {
  const PackageDetailView({required this.slug, super.key});

  final String slug;

  @override
  Component build(BuildContext context) {
    final List<Map<String, dynamic>> packages = _packageItemsFromData(context.page.data['packages']);

    final Map<String, dynamic>? package = packages.cast<Map<String, dynamic>?>().firstWhere(
      (Map<String, dynamic>? item) => item?['slug']?.toString() == slug,
      orElse: () => null,
    );

    if (package == null) {
      return div(classes: 'border border-border bg-card p-6', [
        h2(classes: 'text-2xl font-semibold tracking-tight', [.text('Package not found')]),
        p(classes: 'mt-3 text-sm leading-6 text-muted-foreground', [
          .text('No package entry was found for slug "$slug" in content/_data/packages.yaml.'),
        ]),
      ]);
    }

    final String name = package['name']?.toString() ?? slug;
    final String summary = package['summary']?.toString() ?? '';
    final String pubUrl = package['pubUrl']?.toString() ?? '';
    final String repository = package['repository']?.toString() ?? '';

    return div(classes: 'grid gap-3', [
      section(classes: 'border border-border bg-card p-6', [
        h2(classes: 'text-3xl font-semibold tracking-tight', [.text(name)]),
        if (summary.isNotEmpty) ...[
          p(classes: 'mt-3 text-sm leading-7 text-muted-foreground md:text-base', [.text(summary)]),
        ],
        div(classes: 'mt-5 flex flex-wrap gap-2.5', [
          if (pubUrl.isNotEmpty) ...[
            a(
              href: pubUrl,
              classes:
                  'inline-flex items-center bg-primary px-4 py-2 text-sm font-semibold text-primary-foreground transition-opacity hover:opacity-90',
              [.text('Open on pub.dev')],
            ),
          ],
          if (repository.isNotEmpty) ...[
            a(
              href: repository,
              classes:
                  'inline-flex items-center border border-border bg-card px-4 py-2 text-sm font-semibold text-foreground transition-colors hover:bg-accent',
              [.text('Repository')],
            ),
          ],
        ]),
      ]),
      section(classes: 'border border-border bg-card p-6', [
        h3(classes: 'text-lg font-semibold tracking-tight text-card-foreground', [.text('Install')]),
        // Use same markdown code-block styling and language class so Prism and our .code-block styles apply
        div(classes: 'mt-3', [
          div(classes: 'code-block', [
            pre(classes: 'border border-border bg-muted p-4 text-sm overflow-x-auto', [
              code(classes: 'language-dart', [.text('dart pub add $name')]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }
}

class PostDetailView extends StatelessComponent {
  const PostDetailView({required this.slug, super.key});

  final String slug;

  @override
  Component build(BuildContext context) {
    final List<Map<String, dynamic>> posts = _postItemsFromData(context.page.data['posts']);

    final Map<String, dynamic>? post = posts.cast<Map<String, dynamic>?>().firstWhere(
      (Map<String, dynamic>? item) => item?['slug']?.toString() == slug,
      orElse: () => null,
    );

    if (post == null) {
      return div(classes: 'border border-border bg-card p-6', [
        h2(classes: 'text-2xl font-semibold tracking-tight', [.text('Post not found')]),
        p(classes: 'mt-3 text-sm leading-6 text-muted-foreground', [
          .text('No post entry was found for slug "$slug" in content/_data/posts.yaml.'),
        ]),
      ]);
    }

    final String title = post['name']?.toString() ?? post['title']?.toString() ?? slug;
    final String content = post['content']?.toString() ?? '';
    final String date = post['date']?.toString() ?? '';

    return article(classes: 'border border-border bg-card p-6 md:p-8', [
      if (date.isNotEmpty) ...[
        p(classes: 'text-xs font-semibold uppercase tracking-[0.12em] text-muted-foreground', [
          .text(date),
        ]),
        div(classes: 'mt-4 border-t border-border', []),
      ],
      h1(classes: 'mt-6 text-3xl font-semibold tracking-tight', [.text(title)]),
      if (content.isNotEmpty) ...[
        div(classes: 'prose prose-sm mt-6 max-w-none text-foreground', [
          // Convert markdown content to HTML - for now just use raw text
          // TODO: Add markdown processing if needed
          ...content.split('\n\n').map((String paragraph) {
            if (paragraph.trim().isEmpty) return Component.empty();
            if (paragraph.startsWith('## ')) {
              return h2(classes: 'text-xl font-semibold mt-6 mb-3', [.text(paragraph.substring(3))]);
            }
            if (paragraph.startsWith('# ')) {
              return h2(classes: 'text-2xl font-semibold mt-6 mb-3', [.text(paragraph.substring(2))]);
            }
            if (paragraph.startsWith('- ')) {
              final List<String> items = paragraph.split('\n').where((line) => line.trim().isNotEmpty).toList();
              return ul(classes: 'list-disc list-inside space-y-1 mt-3', [
                ...items.map((item) => li([.text(item.substring(2).trim())])),
              ]);
            }
            return p(classes: 'mt-3 leading-7', [.text(paragraph)]);
          }),
        ]),
      ],
    ]);
  }
}
