import 'package:shop_app/ins/net.dart';

class Favorite {
  String id;
  DateTime date;

  String file = "";

  Favorite({this.id});

  static void add(String id) {
    get(onDone: (data) {
      List<Favorite> d = data;
      d.add(Favorite(
        id: id,
      ));
      d.map((l) => l.tojson()).toList();
      update(d);
    }, ISFileOntExist: () {
      List<Favorite> d = [Favorite(id: id)];
      d.map((l) => l.tojson()).toList();
      update(d);
    });
  }

  factory Favorite.fromJson(Map<String, dynamic> data) {
    var c = Favorite(
      id: data["id"],
    );

    return c;
  }

  List<dynamic> tojson() {
    return {
      "id": id,
    };
  }

  remove() {}

  static void update(List<dynamic> data, {Function onDone}) {
    INSNet.jsonWriteData(file, data, onDone: (file, data) {
      List<Favorite> cat_data = List<Favorite>.from(
          data.map((data) => Favorite.fromJson(data)).toList());

      onDone(cat_data);
    });
  }

  static void get({Function onDone, Function ISFileOntExist}) {
    INSNet.jsonReadData(file, onDone: (data, file) {
      List<Favorite> cat_data = List<Favorite>.from(
          data.map((data) => Favorite.fromJson(data)).toList());
      onDone(cat_data);
    }, ISFileOntExist: ISFileOntExist);
  }
}
