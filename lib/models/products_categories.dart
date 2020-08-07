import 'package:shop_app/ins/net.dart';

class ProductsCategories {
  static String type = "sys_content_categories";
  static String query = "/cat_id/38/";

  static String file = "sys_products_categories";

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

  ProductsCategories({
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

  factory ProductsCategories.fromJson(Map<String, dynamic> data) {
    var c = ProductsCategories(
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
          INSNet.jsonWriteData(file, data, onDone: (file, data) {
            List<ProductsCategories> cat_data = List<ProductsCategories>.from(
                data.map((data) => ProductsCategories.fromJson(data)).toList());

            onDone(cat_data);
          });
        });
  }

  static void get(Function onDone) {
    INSNet.jsonReadData(file, onDone: (data, file) {
      List<ProductsCategories> cat_data = List<ProductsCategories>.from(
          data.map((data) => ProductsCategories.fromJson(data)).toList());
      onDone(cat_data);
    }, ISFileOntExist: (path) {
      update(onDone: onDone);
    });
  }
}
