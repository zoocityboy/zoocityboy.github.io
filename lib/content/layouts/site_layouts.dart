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
