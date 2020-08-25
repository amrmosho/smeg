import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/net.dart';

//http://smeg.sys4me.com/insapi/sys_content_categories/cat_id/38/
class ContentCategories {
  static String type = "sys_content_categories";
  static String query = "";

  String id,
      title,
      alias,
      des,
      image,
      sys_order,
      sys_disabled,
      sys_modified,
      sys_created,
      cat_id,
      sys_languages;

  ContentCategories({
    this.id,
    this.title,
    this.alias,
    this.des,
    this.image,
    this.sys_order,
    this.sys_disabled,
    this.sys_modified,
    this.sys_created,
    this.cat_id,
    this.sys_languages,
  });

  factory ContentCategories.fromJson(Map<String, dynamic> data) {
    var c = ContentCategories(
      id: data["id"],
      title: data["title"],
      alias: data["alias"],
      des: data["des"],
      image: data["image"],
      sys_order: data["sys_order"],
      sys_disabled: data["sys_disabled"],
      sys_modified: data["sys_modified"],
      sys_created: data["sys_created"],
      cat_id: data["cat_id"],
      sys_languages: data["sys_languages"],
    );

    return c;
  }

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "title": title,
      "alias": alias,
      "des": des,
      "image": image,
      "sys_order": sys_order,
      "sys_disabled": sys_disabled,
      "sys_modified": sys_modified,
      "sys_created": sys_created,
      "cat_id": cat_id,
      "sys_languages": sys_languages
    };
  }

  static void update({Function onDone}) {
    INSNet.getJsone(
        addToUrl: "/$type/$query",
        onDone: (data) {
          INSNet.jsonWriteData(type, data, onDone: (file, data) {
            List<ContentCategories> cat_data = List<ContentCategories>.from(
                data.map((data) => ContentCategories.fromJson(data)).toList());

            onDone(cat_data);
          });
        });
  }

  static void get(Function onDone) {
    INSNet.jsonReadData(type, onDone: (data, file) {
      List<ContentCategories> cat_data = List<ContentCategories>.from(data
          .map((data) => updattLang(ContentCategories.fromJson(data)))
          .toList());

      onDone(cat_data);
    }, ISFileOntExist: (path) {
      update(onDone: onDone);
    });
  }

  static ContentCategories updattLang(ContentCategories data) {
    ContentCategories r = data;
    //if (lang == "ar") {}

    return r;
  }
}
