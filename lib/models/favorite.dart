import 'package:shop_app/ins/net.dart';

class Favorite {
  String id;
  // DateTime date;
  static String fileName = "favorite";

  Favorite({this.id});

  static void add(String id) {
    Favorite.get(onDone: (data) {
      List<Favorite> d = data;
      d.add(Favorite(
        id: id,
      ));
      var aa = d.map((l) => l.tojson()).toList();
      Favorite.update(aa);
    }, ISFileOntExist: (path) {
      List<Favorite> d = [Favorite(id: id)];
      var aa = d.map((l) => l.tojson()).toList();
      Favorite.update(aa);
    });
  }

  factory Favorite.fromJson(Map<String, dynamic> data) {
    var c = Favorite(id: data["id"]);

    return c;
  }

  Map<String, dynamic> tojson() {
    Map<String, dynamic> a = Map();
    return {
      "id": id,
    };
  }

  remove() {}

  static void update(List<dynamic> data, {Function onDone}) {
    INSNet.jsonWriteData(fileName, data, onDone: (file, data) {
      List<Favorite> cat_data = List<Favorite>.from(
          data.map((data) => Favorite.fromJson(data)).toList());

      onDone(cat_data);
    });
  }

  static void get({Function onDone, Function ISFileOntExist}) {
    INSNet.jsonReadData(fileName, onDone: (data, file) {
      List<Favorite> cat_data = List<Favorite>.from(
          data.map((data) => Favorite.fromJson(data)).toList());
      onDone(cat_data);
    }, ISFileOntExist: ISFileOntExist);
  }
}
