import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'section_title.dart';

class FAQSection extends StatelessComponent {
  const FAQSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'faq', classes: 'space-y-8 pb-20', [
      const SectionTitle(title: 'Common questions'),
      div(classes: 'grid gap-3 md:grid-cols-2', [
        _FaqItem(
          number: '01',
          question: "What's a skill exactly?",
          answer: 'A reusable instruction set that your coding agent can follow each time for predictable output.',
        ),
        _FaqItem(
          number: '02',
          question: 'What tools does this work with?',
          answer: 'Most AI coding tools that support skills and MCP-based context sources can use this setup.',
        ),
        _FaqItem(
          number: '03',
          question: 'Is this free?',
          answer:
              'The directory model is free to browse and copy from, making adoption easy for solo and team workflows.',
        ),
        _FaqItem(
          number: '04',
          question: 'Where do I put the files?',
          answer: 'Install skills in your tool-specific folder locally per project or globally in your home directory.',
        ),
      ]),
    ]);
  }
}

class _FaqItem extends StatelessComponent {
  const _FaqItem({required this.number, required this.question, required this.answer});

  final String number;
  final String question;
  final String answer;

  @override
  Component build(BuildContext context) {
    return article(classes: 'pb-card p-6', [
      p(classes: 'pb-kicker', [.text(number)]),
      h3(classes: 'mt-3 text-lg font-semibold text-card-foreground', [.text(question)]),
      p(classes: 'mt-3 text-sm leading-6 text-muted-foreground', [.text(answer)]),
    ]);
  }
}
