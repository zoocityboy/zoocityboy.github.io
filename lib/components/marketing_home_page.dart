import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:site/content/components/home/director.dart';
import 'package:site/content/components/home/hero.dart';
import 'package:site/content/footer_component.dart';
import 'package:site/content/nav_component.dart';

/// Renders the class-based marketing homepage layout.
class MarketingHomePage extends StatelessComponent {
  const MarketingHomePage({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      const NavComponent(),
      main_(classes: 'mx-auto w-full max-w-5xl px-6 pb-24 pt-10 md:px-8', [
        const HeroComponent(),
        const DirectoryComponent(),
        _buildFrequentlyAskedQuestions(),
        _buildClosingCta(),
      ]),
      const FooterComponent(),
    ]);
  }

  Component _buildFrequentlyAskedQuestions() {
    return section(id: 'faq', classes: 'space-y-8 pb-20', [
      h2(classes: 'text-3xl font-semibold tracking-tight md:text-4xl', [.text('Common questions')]),
      div(classes: 'grid gap-3 md:grid-cols-2', [
        _buildFaqItem(
          number: '01',
          question: "What's a skill exactly?",
          answer: 'A reusable instruction set that your coding agent can follow each time for predictable output.',
        ),
        _buildFaqItem(
          number: '02',
          question: 'What tools does this work with?',
          answer: 'Most AI coding tools that support skills and MCP-based context sources can use this setup.',
        ),
        _buildFaqItem(
          number: '03',
          question: 'Is this free?',
          answer:
              'The directory model is free to browse and copy from, making adoption easy for solo and team workflows.',
        ),
        _buildFaqItem(
          number: '04',
          question: 'Where do I put the files?',
          answer: 'Install skills in your tool-specific folder locally per project or globally in your home directory.',
        ),
      ]),
    ]);
  }

  Component _buildFaqItem({
    required String number,
    required String question,
    required String answer,
  }) {
    return article(classes: 'pb-card p-6', [
      p(classes: 'pb-kicker', [.text(number)]),
      h3(classes: 'mt-3 text-lg font-semibold text-card-foreground', [.text(question)]),
      p(classes: 'mt-3 text-sm leading-6 text-muted-foreground', [.text(answer)]),
    ]);
  }

  Component _buildClosingCta() {
    return section(classes: 'pb-card px-6 py-10 md:px-8', [
      div(classes: 'flex flex-col gap-6 md:flex-row md:items-center md:justify-between', [
        div(classes: 'space-y-2', [
          h2(classes: 'text-2xl font-semibold tracking-tight md:text-3xl', [.text('Give your agent better context.')]),
          p(classes: 'text-sm text-muted-foreground md:text-base', [
            .text('Get better code and fewer hallucinations with a reusable skill-first setup.'),
          ]),
        ]),
        div(classes: 'flex flex-wrap gap-3', [
          a(
            href: '#directory',
            classes: 'pb-button-primary',
            [.text('Browse skills')],
          ),
          a(
            href: '#faq',
            classes: 'pb-button-secondary',
            [.text('Browse MCP servers')],
          ),
        ]),
      ]),
    ]);
  }
}
