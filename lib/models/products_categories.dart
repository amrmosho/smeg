import 'dart:convert';

import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/lang.dart';
import 'package:shop_app/ins/net.dart';

class ProductsCategories {
  static String type = "com_icac_products_categories";
  static String query = "";

  static String file = "sys_products_categories";
  int sys_order;
  String id,
      title,
      alias,
      des,
      image,
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
      sys_order: int.parse(data["sys_order"]),
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

  static void getData(Function onDone) {
    INSNet.jsonReadData(file, onDone: (data, file) {
      List<ProductsCategories> cat_data = List<ProductsCategories>.from(data
          .map((data) => updattLang(ProductsCategories.fromJson(data)))
          .toList());
      onDone(cat_data);
    }, ISFileOntExist: (path) {
      update(onDone: onDone);
    });
  }

  static void get({Function onDone, String cat_id, String id}) {
    getData((data) {
      if (cat_id != null) {
        if (cat_id == "0") {
          data = data
              .where((l) =>
                  l.cat_id == null ||
                  l.cat_id.contains("0") ||
                  l.cat_id.contains("null") ||
                  l.cat_id.contains(""))
              .toList();
        } else {
          data = data
              .where((l) =>
                  l.cat_id != null &&
                  l.cat_id.split(",").contains(cat_id.toString()))
              .toList();
        }
      } else if (id != null) {
        data = data.where((l) => l.id.contains(id.toString())).toList();
      }

      List<ProductsCategories> _categories = data;
      _categories.sort((l, b) {
        return l.sys_order.compareTo(b.sys_order);
      });
      onDone(_categories);
    });
  }

  static ProductsCategories updattLang(ProductsCategories data) {
    if (language == Language.ar) {
      if (data.sys_languages != "") {
        Map l = jsonDecode(data.sys_languages);
        if (l.containsKey("title")) {
          Map ltitle = l["title"];
          if (ltitle.containsKey("ar")) {
            data.title = ltitle["ar"];
          }
        }
      }
    }
    return data;
  }
}
