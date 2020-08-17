import 'package:shop_app/ins/net.dart';

class SiteConfig {
  static String type = "sys_site_config";
  static String query = "";

  String id, version;
  SiteConfig({this.id, this.version});
  factory SiteConfig.fromJson(Map<String, dynamic> data) {
    var c = SiteConfig(id: data["id"], version: data["version"]);
    return c;
  }

  Map<String, dynamic> tojson() {
    return {"id": id, "version": version};
  }

  static void update({Function onDone}) {
    INSNet.getJsone(
        addToUrl: "/$type/$query",
        onDone: (data) {
          INSNet.jsonWriteData(type, data, onDone: (file, data) {
            List<SiteConfig> cat_data = List<SiteConfig>.from(
                data.map((data) => SiteConfig.fromJson(data)).toList());
            if (onDone != null) {
              onDone(cat_data);
            }
          });
        });
  }

  static void get(Function onDone) {
    INSNet.jsonReadData(type, onDone: (data, file) {
      List<SiteConfig> cat_data = List<SiteConfig>.from(
          data.map((data) => SiteConfig.fromJson(data)).toList());

      onDone(cat_data);
    }, ISFileOntExist: (path) {
      update(onDone: onDone);
    });
  }

  static void chekVersion(Function onDone) async {
    INSNet.jsonReadData(type, onDone: (data, file) async {
      List<SiteConfig> cat_data = List<SiteConfig>.from(
          data.map((data) => SiteConfig.fromJson(data)).toList());

      var a = await INSNet.is_connected();

      if (a == true) {
        INSNet.getJsone(
            addToUrl: "/$type/$query",
            onDone: (onlineData) {
              if (onlineData != false) {
                var d = (onlineData[0]["version"] == cat_data[0].version);
                onDone(true, true, d);
              } else {
                onDone(false, true, false);
              }
            });
      } else {
        onDone(false, true, false);
      }
    }, ISFileOntExist: (path) async {
      var a = await INSNet.is_connected();

      if (a == true) {
        onDone(true, false, false);
      } else {
        onDone(false, false, false);
      }
    });
  }
}
