import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/ins/net.dart';

//http://smeg.sys4me.com/insapi/sys_content_categories/cat_id/38/
class Product {
  static String type = "com_icac_products";
  static String query = "";

  String id,
      title,
      alias,
      des,
      image,
      th_image,
      images,
      body,
      cat_id,
      sys_disabled,
      sys_modified,
      sys_created,
      sys_languages;

  int color, num, price, sys_order;

  Product({
    this.id,
    this.title,
    this.alias,
    this.des,
    this.body,
    this.image,
    this.color,
    this.price,
    this.th_image,
    this.images,
    this.sys_order,
    this.sys_disabled,
    this.sys_modified,
    this.sys_created,
    this.cat_id,
    this.sys_languages,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    var c = Product(
      id: data["id"],
      title: data["title"],
      alias: data["alias"],
      color: int.parse(data["color"].replaceAll("#", "0XFF")),
      price: (data["price"] == "") ? 0 : int.parse(data["price"]),
      des: data["des"],
      body: data["body"],
      image: data["image"],
      th_image: data["th_image"],
      images: data["images"],
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
            List<Product> cat_data = List<Product>.from(
                data.map((data) => Product.fromJson(data)).toList());

            onDone(cat_data);
          });
        });
  }

  static void getData(Function onDone) {
    //INSData.getContentByCatID(products, catid),

    INSNet.jsonReadData(type, onDone: (data, file) {
      List<Product> cat_data = List<Product>.from(
          data.map((data) => Product.fromJson(data)).toList());
      onDone(cat_data);
    }, ISFileOntExist: (path) {
      update(onDone: onDone);
    });
  }

  static void get(Function onDone, {String cat_id, String title}) {
    //INSData.getContentByCatID(products, catid),
    getData((data) {
      if (cat_id != null) {
        data = data
            .where((l) =>
                (cat_id == null ||
                    l.cat_id.split(",").contains(cat_id.toString())) &&
                (title == null ||
                    l.title.toUpperCase().contains(title.toUpperCase())))
            .toList();
      }

      List<Product> _categories = data;
      _categories.sort((l, b) {
        return l.sys_order.compareTo(b.sys_order);
      });
      onDone(_categories);

      onDone(data);
    });
  }
}
