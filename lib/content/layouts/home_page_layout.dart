import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/components/marketing_home_page.dart';
import 'package:site/content/layouts/site_layouts.dart';

class HomePageLayout extends MyBaseLayout {
  const HomePageLayout();

  @override
  Pattern get name => 'home';

  @override
  Component buildBody(Page page, Component child) {
    return const MarketingHomePage();
  }
}
