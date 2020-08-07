import 'package:shop_app/models/products_categories.dart';
import 'package:shop_app/models/sys_site_config.dart';
import 'content_categories.dart';

class AppData {
  static void chekData() {
    SiteConfig.chekVersion((is_equal) {
      ProductsCategories.update();
      if (!is_equal) {
        ContentCategories.update();
        SiteConfig.update();
      }
    });
  }
}
