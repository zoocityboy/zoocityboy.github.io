// Do not import `dart:io` here: web builds don't support it.

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';

Map<String, dynamic> asStringMap(Object? value) {
  if (value is Map) {
    return value.map((Object? key, Object? val) => MapEntry(key.toString(), val));
  }
  return <String, dynamic>{};
}

Map<String, dynamic> pageMeta(Page page) {
  return asStringMap(page.data['page']);
}

// `BASE_HREF` should be provided at compile time with `--dart-define=BASE_HREF=/docs/`
// Fallback is `/` (root).
const String baseHrefValue = String.fromEnvironment('BASE_HREF', defaultValue: '');

/// Prefix a path with the configured `BASE_HREF`.
///
/// Examples:
/// - `prefixPath('/')` -> `/docs/`
/// - `prefixPath('/posts')` -> `/docs/posts`
String prefixPath(String path) {
  // Only prefix paths that begin with a leading slash. Leave external URLs
  // and fragment/relative paths untouched.
  if (!path.startsWith('/')) return path;
  final base = baseHrefValue;
  if (base == '/' || base.isEmpty) return path;
  final p = path == '/' ? '' : path.substring(1);
  if (base.endsWith('/')) return '$base$p';
  return '$base/$p';
}

class BaseHrefTag extends StatelessComponent {
  const BaseHrefTag({super.key});

  @override
  Component build(BuildContext context) {
    if (baseHrefValue.isEmpty) return const Component.empty();
    return Component.element(
      tag: 'base',
      attributes: {'href': baseHrefValue},
    );
  }
}

Component codeBlockLanguageLabelScript() {
  return script(
    content: r"""
      (function(){
        function setLangLabels(){
          document.querySelectorAll('.code-block').forEach(function(cb){
            var code = cb.querySelector('code[class*="language-"]');
            var lang = 'code';
            if(code){
              var m = code.className.match(/language-([^\s]+)/);
              if(m) lang = m[1];
            }
            cb.setAttribute('data-lang', lang.toUpperCase());
          });
        }
        if(document.readyState === 'loading'){
          document.addEventListener('DOMContentLoaded', setLangLabels);
        } else { setLangLabels(); }
      })();
    """,
  );
}

abstract class MyBaseLayout extends PageLayoutBase {
  const MyBaseLayout();

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
    yield const BaseHrefTag();
    yield meta(name: 'viewport', content: 'width=device-width, initial-scale=1');
    yield link(href: prefixPath('/styles.css'), rel: 'stylesheet', id: 'site-styles');
  }
}
