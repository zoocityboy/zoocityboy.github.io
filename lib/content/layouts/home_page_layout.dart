import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/components/marketing_home_page.dart';
import 'package:site/constants.dart';

class HomePageLayout extends PageLayoutBase {
  const HomePageLayout();

  @override
  Pattern get name => 'home';

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
    yield const baseHref();

    yield meta(name: 'viewport', content: 'width=device-width, initial-scale=1');
    yield link(href: 'styles.css', rel: 'stylesheet', id: 'site-styles');
  }

  @override
  Component buildBody(Page page, Component child) {
    return const MarketingHomePage();
  }
}
