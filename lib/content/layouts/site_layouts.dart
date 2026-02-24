import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/content/footer_component.dart';
import 'package:site/content/nav_component.dart';

import '../../components/marketing_home_page.dart';
import '../components/content_views.dart';

Map<String, dynamic> _asStringMap(Object? value) {
  if (value is Map) {
    return value.map((Object? key, Object? val) => MapEntry(key.toString(), val));
  }
  return <String, dynamic>{};
}

Map<String, dynamic> _pageMeta(Page page) {
  return _asStringMap(page.data['page']);
}

class HomePageLayout extends PageLayoutBase {
  const HomePageLayout();

  @override
  Pattern get name => 'home';

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);

    yield meta(name: 'viewport', content: 'width=device-width, initial-scale=1');
    yield link(href: '/styles.css', rel: 'stylesheet', id: 'site-styles');
    // yield script(
    //   content:
    //       r"(function(){try{fetch('/styles.css',{method:'HEAD'}).then(function(res){if(!res.ok){var l=document.getElementById('site-styles');if(l)l.href='styles.css';}}).catch(function(){var l=document.getElementById('site-styles');if(l)l.href='styles.css';});}catch(e){} })();",
    // );
  }

  @override
  Component buildBody(Page page, Component child) {
    return const MarketingHomePage();
  }

  @override
  Component buildLayout(Page page, Component child) {
    return Component.fragment([
      Document.html(attributes: {'class': 'dark'}),
      super.buildLayout(page, child),
    ]);
  }
}

class PostsLayout extends PageLayoutBase {
  const PostsLayout();

  @override
  Pattern get name => 'posts';

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
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
      title: _pageMeta(page)['title']?.toString() ?? 'Blog',
      subtitle: _pageMeta(page)['description']?.toString(),
      child: div(classes: 'space-y-8', [
        child,
        const BlogPostListView(),
      ]),
    );
    return Component.fragment([
      NavComponent(),
      main_(classes: 'mx-auto w-full max-w-5xl px-6 pb-24 pt-10 md:px-8', [
        if (_pageMeta(page)['title'] != null)
          h1(classes: 'text-4xl font-semibold tracking-tighter md:text-5xl', [
            .text(_pageMeta(page)['title'].toString()),
          ]),
        if (_pageMeta(page)['description'] != null)
          p(classes: 'mt-4 max-w-[64ch] text-sm leading-7 text-muted-foreground md:text-base', [
            .text(_pageMeta(page)['description'].toString()),
          ]),
        div(classes: 'space-y-8', [
          child,
          const BlogPostListView(),
        ]),
      ]),
      const FooterComponent(),
    ]);
  }

  @override
  Component buildLayout(Page page, Component child) {
    return Component.fragment([
      Document.html(attributes: {'class': 'dark'}),
      super.buildLayout(page, child),
    ]);
  }
}

class PostLayout extends PageLayoutBase {
  const PostLayout();

  @override
  Pattern get name => 'post';

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
    yield meta(name: 'viewport', content: 'width=device-width, initial-scale=1');
    yield link(href: '/styles.css', rel: 'stylesheet', id: 'site-styles');
    // yield script(
    //   content:
    //       r"(function(){try{fetch('/styles.css',{method:'HEAD'}).then(function(res){if(!res.ok){var l=document.getElementById('site-styles');if(l)l.href='styles.css';}}).catch(function(){var l=document.getElementById('site-styles');if(l)l.href='styles.css';});}catch(e){} })();",
    // );
  }

  @override
  Component buildLayout(Page page, Component child) {
    return Component.fragment([
      Document.html(attributes: {'class': 'dark'}),
      super.buildLayout(page, child),
    ]);
  }

  @override
  Component buildBody(Page page, Component child) {
    final Map<String, dynamic> meta = _pageMeta(page);

    return SiteFrame(
      activePath: '/posts',
      title: meta['title']?.toString() ?? 'Blog Post',
      subtitle: meta['description']?.toString(),
      child: article(classes: 'border border-border bg-card p-6 md:p-8', [
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

class PackagesListLayout extends PageLayoutBase {
  const PackagesListLayout();

  @override
  Pattern get name => 'packages_list';
  @override
  Component buildLayout(Page page, Component child) {
    return Component.fragment([
      Document.html(attributes: {'class': 'dark'}),
      super.buildLayout(page, child),
    ]);
  }

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
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
      activePath: '/packages',
      title: _pageMeta(page)['title']?.toString() ?? 'Packages',
      subtitle: _pageMeta(page)['description']?.toString(),
      child: div(classes: 'space-y-8', [
        child,
        const PackagesListView(),
      ]),
    );
  }
}

class PackageDetailLayout extends PageLayoutBase {
  const PackageDetailLayout();

  @override
  Pattern get name => 'package_detail';
  @override
  Component buildLayout(Page page, Component child) {
    return Component.fragment([
      Document.html(attributes: {'class': 'dark'}),
      super.buildLayout(page, child),
    ]);
  }

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
    yield meta(name: 'viewport', content: 'width=device-width, initial-scale=1');
    yield link(href: '/styles.css', rel: 'stylesheet', id: 'site-styles');
    // yield script(
    //   content:
    //       r"(function(){try{fetch('/styles.css',{method:'HEAD'}).then(function(res){if(!res.ok){var l=document.getElementById('site-styles');if(l)l.href='styles.css';}}).catch(function(){var l=document.getElementById('site-styles');if(l)l.href='styles.css';});}catch(e){} })();",
    // );
  }

  @override
  Component buildBody(Page page, Component child) {
    final Map<String, dynamic> meta = _pageMeta(page);
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
