import 'dart:convert';

import 'package:json_practice/model_class.dart';


List<AndroidVersion> parseJson(String jsonString) {
  List<AndroidVersion> versions = [];
  final parsedJson = json.decode(jsonString);

  for (var item in parsedJson) {
    if (item is Map) {
      item.forEach((key, value) {
        versions.add(AndroidVersion(id: value['id'], title: value['title']));
      });
    } else if (item is List) {
      for (var version in item) {
        versions.add(AndroidVersion(id: version['id'], title: version['title']));
      }
    }
  }

  return versions;
}
const String jsonString1 = '''
  [
    {"0":{"id":1,"title":"Gingerbread"},"1":{"id":2,"title":"Jellybean"},"3":{"id":3,"title":"KitKat"}},
    [{"id":4,"title":"Lollipop"},{"id":5,"title":"Pie"},{"id":6,"title":"Oreo"},{"id":7,"title":"Nougat"}]
  ]
  ''';

const String jsonString2 = '''
  [
    {"0":{"id":1,"title":"Gingerbread"},"1":{"id":2,"title":"Jellybean"},"3":{"id":3,"title":"KitKat"}},
    {"0":{"id":8,"title":"Froyo"},"2":{"id":9,"title":"Éclair"},"3":{"id":10,"title":"Donut"}},
    [{"id":4,"title":"Lollipop"},{"id":5,"title":"Pie"},{"id":6,"title":"Oreo"},{"id":7,"title":"Nougat"}]
  ]
  ''';
