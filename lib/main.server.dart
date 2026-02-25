/// The entrypoint for the **server** environment.
library;

import 'package:jaspr/server.dart';
import 'package:jaspr_content/components/callout.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_content/theme.dart';
import 'package:jaspr_content_snippets/jaspr_content_snippets.dart' hide Highlighter;
import 'package:site/content/layouts/home_page_layout.dart';
import 'package:site/content/layouts/package_detail_layout.dart';
import 'package:site/content/layouts/packages_list_layout.dart';
import 'package:site/content/layouts/post_layout.dart';
import 'package:site/content/layouts/posts_layout.dart';
import 'package:syntax_highlight_lite/syntax_highlight_lite.dart';

import 'main.server.options.dart';

Future<void> main() async {
  Jaspr.initializeApp(options: defaultServerOptions);
  await Highlighter.initialize([
    'dart',
    'yaml',
    'json',
    'javascript',
    'python',
    'java',
    'csharp',
    'cpp',
    'ruby',
    'go',
    'php',
    'swift',
    'kotlin',
  ]);
  runApp(
    ContentApp.custom(
      loaders: [
        FilesystemLoader('content'),
      ],
      configResolver: PageConfig.all(
        dataLoaders: [
          FilesystemDataLoader('content/_data'),
        ],
        // Register common content components (CodeBlock enables fenced code highlighting)
        components: [
          // CodeBlock(
          //   defaultLanguage: 'dart',
          //   codeTheme: await HighlighterTheme.loadDarkTheme(),
          // ),
          BetterCodeBlock(),
          Callout(),
        ],
        templateEngine: MustacheTemplateEngine(),
        parsers: [
          MarkdownParser(),
          HtmlParser(),
        ],
        layouts: [
          HomePageLayout(),
          PostsLayout(),
          PostLayout(),
          PackagesListLayout(),
          PackageDetailLayout(),
        ],
        theme: ContentTheme.none(),
      ),
    ),
  );
}
