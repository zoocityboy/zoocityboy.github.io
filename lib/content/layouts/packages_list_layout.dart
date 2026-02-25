import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/content/components/content_views.dart';
import 'package:site/content/layouts/site_layouts.dart';

class PackagesListLayout extends MyBaseLayout {
  const PackagesListLayout();

  @override
  Pattern get name => 'packages_list';

  @override
  Component buildBody(Page page, Component child) {
    return SiteFrame(
      activePath: '/packages',
      title: pageMeta(page)['title']?.toString() ?? 'Packages',
      subtitle: pageMeta(page)['description']?.toString(),
      child: div(classes: 'space-y-8', [
        child,
        const PackagesListView(),
      ]),
    );
  }
}
