import 'package:shop_app/models/sys_site_config.dart';
import 'content_categories.dart';

class AppData {
  static void chekData() {
    SiteConfig.chekVersion((is_equal) {
      print(is_equal);
      if (!is_equal) {
        ContentCategories.update();
        SiteConfig.update();
      }
    });
  }
}
