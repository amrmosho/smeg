import 'package:shop_app/ins/net.dart';

class Favorite {
  String id;
  DateTime date;
  static String fileName = "";

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
    List<dynamic> a = List();
    a.add({
      "id": id,
    });

    return a;
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
