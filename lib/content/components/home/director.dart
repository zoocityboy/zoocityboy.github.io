import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class DirectoryComponent extends StatelessComponent {
  const DirectoryComponent({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'directory', classes: 'space-y-8 pb-20', [
      h2(classes: 'text-3xl font-semibold tracking-tight md:text-4xl', [.text("What's in the directory")]),
      div(classes: 'grid gap-3 md:grid-cols-3', [
        _buildDirectoryCard(
          index: '01',
          title: 'Agent skills',
          description:
              'Reusable instructions that teach your agent how to do things with consistent behavior across tasks.',
        ),
        _buildDirectoryCard(
          index: '02',
          title: 'Skill bundles',
          description:
              'Install grouped skills for frameworks or workflows instead of wiring each instruction one by one.',
        ),
        _buildDirectoryCard(
          index: '03',
          title: 'MCP servers',
          description: 'Tooling-specific MCP configurations and docs that are ready to paste into your client setup.',
        ),
      ]),
    ]);
  }

  Component _buildDirectoryCard({
    required String index,
    required String title,
    required String description,
  }) {
    return article(classes: 'pb-card p-6', [
      p(classes: 'pb-kicker', [.text(index)]),
      h3(classes: 'mt-3 text-xl font-semibold tracking-tight text-card-foreground', [.text(title)]),
      p(classes: 'mt-3 text-sm leading-6 text-muted-foreground', [.text(description)]),
    ]);
  }
}
