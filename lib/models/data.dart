import 'package:shop_app/models/products.dart';
import 'package:shop_app/models/products_categories.dart';
import 'package:shop_app/models/sys_site_config.dart';
import 'content_categories.dart';

class AppData {
  static void chekData() {
    SiteConfig.chekVersion((is_equal) {
      if (!is_equal) {
        ProductsCategories.update();
        Product.update();
        ContentCategories.update();
        SiteConfig.update();
      }
    });
  }
}
