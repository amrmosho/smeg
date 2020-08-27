import 'package:Smeg/ins/net.dart';
import 'package:Smeg/models/products.dart';

class Favorite {
  String id;
  // DateTime date;
  static String fileName = "favorite";

  Favorite({this.id});

  static void remove(String id, {Function onDone}) {
    Favorite.get(onDone: (data) {
      List<Favorite> d = data;
      int i = d.indexWhere((element) => element.id == id);
      d.removeAt(i);
      var aa = d.map((l) => l.tojson()).toList();
      Favorite.update(aa);
    });
  }

  static bool isExist(String id, {Function onDone}) {
    Favorite.get(onDone: (data) {
      List<Favorite> d = data;

      for (Favorite f in d) {
        if (f.id == id) {
          onDone(true);
          return true;
        }
      }
      onDone(false);
      return false;
    }, ISFileOntExist: (path) {
      onDone(false);
      return false;
    });
  }

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

  static void getData(Function onDone) {
    List<Product> r = new List();
    Favorite.get(onDone: (data) {
      List<String> ids = List();
      for (Favorite f in data) {
        ids.add(f.id);
      }

      Product.get((productsdata) {
        onDone(productsdata);
      }, ids: ids);
    }, ISFileOntExist: (a) {
      onDone(false);
    });
  }
}
