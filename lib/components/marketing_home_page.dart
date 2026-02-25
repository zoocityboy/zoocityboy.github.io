import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:site/content/components/home/director.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:site/content/components/home/hero.dart';
import 'package:site/content/components/home/recent_posts.dart';
import 'package:site/content/components/home/recent_packages.dart';
import 'package:site/content/footer_component.dart';
import 'package:site/content/nav_component.dart';
import 'package:site/content/components/home/faq_section.dart';
import 'package:site/content/components/home/closing_cta.dart';

/// Renders the class-based marketing homepage layout.
class MarketingHomePage extends StatelessComponent {
  const MarketingHomePage({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      const NavComponent(),
      main_(classes: 'mx-auto w-full max-w-5xl px-6 pb-24 pt-10 md:px-8', [
        HeroBanner(),
        // const HeroComponent(),
        const DirectoryComponent(),
        const RecentPostsSection(),
        const RecentPackagesSection(),
        const FAQSection(),
        const ClosingCta(),
      ]),
      const FooterComponent(),
    ]);
  }
}
