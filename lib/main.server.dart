/// The entrypoint for the **server** environment.
library;

import 'package:jaspr/server.dart';
import 'package:jaspr_content/components/callout.dart';
import 'package:jaspr_content/components/markdown.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_content/components/code_block.dart';
import 'package:jaspr_content/theme.dart';
import 'package:site/content/layouts/home_page_layout.dart';
import 'package:site/content/layouts/package_detail_layout.dart';
import 'package:site/content/layouts/packages_list_layout.dart';
import 'package:site/content/layouts/post_layout.dart';
import 'package:site/content/layouts/posts_layout.dart';

import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    ContentApp.custom(
      eagerlyLoadAllPages: false,
      loaders: [
        FilesystemLoader('content'),
      ],
      configResolver: PageConfig.all(
        dataLoaders: [
          FilesystemDataLoader('content/_data'),
        ],
        // Register common content components (CodeBlock enables fenced code highlighting)
        components: [
          CodeBlock(),
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
