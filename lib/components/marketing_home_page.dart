import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:site/content/components/home/director.dart';
import 'package:site/content/components/home/hero.dart';
import 'package:site/content/components/home/recent_posts.dart';
import 'package:site/content/components/home/recent_packages.dart';
import 'package:site/content/components/footer_component.dart';
import 'package:site/content/components/nav_component.dart';
import 'package:site/content/components/home/faq_section.dart';
import 'package:site/content/components/home/closing_cta.dart';

/// Renders the class-based marketing homepage layout.
class MarketingHomePage extends StatelessComponent {
  const MarketingHomePage({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      const NavComponent(),
      main_([
        const HeroBanner(),
        div(classes: 'container mx-auto max-w-5xl px-4 py-8 overflow-x-hidden flex-1', [
          const DirectoryComponent(),
          const HomepageSpacer(),
          const RecentPostsSection(),
          const HomepageSpacer(),
          const RecentPackagesSection(),
          const HomepageSpacer(),
          const FAQSection(),
          const HomepageSpacer(),
          const ClosingCta(),
        ]),
      ]),
      const FooterComponent(),
    ]);
  }
}

class HomepageSpacer extends StatelessComponent {
  const HomepageSpacer({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'text-muted-foreground/30 font-mono text-sm select-none space-y-8 pb-6',
      attributes: {'aria-hidden': 'true'},
      [
        .text('//'),
      ],
    );
  }
}
