/// The entrypoint for the **server** environment.
library;

import 'package:jaspr/server.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_content/theme.dart';

import 'content/layouts/site_layouts.dart';
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
        templateEngine: MustacheTemplateEngine(),
        parsers: [
          MarkdownParser(),
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
