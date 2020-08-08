import 'package:shop_app/ins/net.dart';

//http://smeg.sys4me.com/insapi/sys_content_categories/cat_id/38/
class Content {
  static String type = "sys_content";
  static String query = "cat_id/39/";

  String id,
      title,
      alias,
      des,
      image,
      th_image,
      images,
      body,
      cat_id,
      sys_order,
      sys_disabled,
      sys_modified,
      sys_created,
      sys_languages;

  Content({
    this.id,
    this.title,
    this.alias,
    this.des,
    this.body,
    this.image,
    this.th_image,
    this.images,
    this.sys_order,
    this.sys_disabled,
    this.sys_modified,
    this.sys_created,
    this.cat_id,
    this.sys_languages,
  });

  factory Content.fromJson(Map<String, dynamic> data) {
    var c = Content(
      id: data["id"],
      title: data["title"],
      alias: data["alias"],
      des: data["des"],
      body: data["body"],
      image: data["image"],
      th_image: data["th_image"],
      images: data["images"],
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
      "body": body,
      "image": image,
      "th_image": th_image,
      "images": images,
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
            List<Content> cat_data = List<Content>.from(
                data.map((data) => Content.fromJson(data)).toList());

            onDone(cat_data);
          });
        });
  }

  static void get(Function onDone) {
    INSNet.jsonReadData(type, onDone: (data, file) {
      List<Content> cat_data = List<Content>.from(
          data.map((data) => Content.fromJson(data)).toList());
      onDone(cat_data);
    }, ISFileOntExist: (path) {
      update(onDone: onDone);
    });
  }
}
