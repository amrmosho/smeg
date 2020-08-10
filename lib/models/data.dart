import 'package:shop_app/ins/net.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/models/products_categories.dart';
import 'package:shop_app/models/sys_site_config.dart';
import 'content_categories.dart';
import 'dart:io';

class AppData {
  static Future<void> chekData() async {
    INSNet.is_connected(onCheck: (stat) {
      if (stat == true) {
        SiteConfig.chekVersion((is_equal) {
          if (!is_equal) {
            ProductsCategories.update();
            Product.update();
            ContentCategories.update();
            SiteConfig.update();
          }
        });
      } else {}
    });
  }
}
