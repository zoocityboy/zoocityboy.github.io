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
          nav(classes: 'text-sm text-muted-foreground', [
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
    final List<Page> blogPosts = context.pages.where((Page page) {
      final Map<String, dynamic> meta = _pageMeta(page);
      final bool isBlogPath = page.path.startsWith('blog/');
      final bool isIndex = page.path.endsWith('blog/index.md') || page.path == 'blog/index.md';
      final bool isPost = meta['type']?.toString() == 'post';
      return isBlogPath && !isIndex && isPost;
    }).toList();

    blogPosts.sort((Page a, Page b) {
      final DateTime dateA =
          DateTime.tryParse(_pageMeta(a)['date']?.toString() ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
      final DateTime dateB =
          DateTime.tryParse(_pageMeta(b)['date']?.toString() ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
      return dateB.compareTo(dateA);
    });

    if (blogPosts.isEmpty) {
      return div(classes: 'border border-border bg-card p-6', [
        p(classes: 'text-sm text-muted-foreground', [.text('No blog posts published yet.')]),
      ]);
    }

    return div(classes: 'grid gap-3', [
      ...blogPosts.map((Page post) {
        final Map<String, dynamic> meta = _pageMeta(post);
        final String title = meta['title']?.toString() ?? post.path;
        final String description = meta['description']?.toString() ?? '';
        final String date = meta['date']?.toString() ?? '';

        return article(classes: 'border border-border bg-card p-6', [
          p(classes: 'text-xs font-semibold uppercase tracking-[0.12em] text-muted-foreground', [.text(date)]),
          h2(classes: 'mt-3 text-2xl font-semibold tracking-tight text-card-foreground', [
            a(href: post.url, classes: 'transition-colors hover:text-primary', [.text(title)]),
          ]),
          if (description.isNotEmpty) ...[
            p(classes: 'mt-3 text-sm leading-6 text-muted-foreground', [.text(description)]),
          ],
          a(
            href: post.url,
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
        final String pubUrl = package['pubUrl']?.toString() ?? '';

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
