import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shop_app/models/content.dart';

class INSNet {
  static String url = "http://smeg.sys4me.com/insapi/";
/*
  static String url =
      "http://smeg.sys4me.com/insapi/sys_menus_items/parent_id/37/";*/

  static Future<List> getJsone(
      {String url,
      String addToUrl,
      Object data,
      Function onDone,
      Function onGetError}) async {
    url = url == null ? INSNet.url : url;

    url += addToUrl == null ? "" : addToUrl;

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

// If the server did return a 201 CREATED response,
    // then parse the JSON.
    if (response.statusCode == 200) {
      if (onDone != null) {
        onDone(jsonDecode(response.body));
      }
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.

      onGetError ?? onGetError(json.decode(response.body));

      throw Exception('Failed to create album.');
    }
  }

  static File jsonCreateFile(String path, String conent) {
    File file = new File(path);
    file.createSync();
    file.writeAsStringSync(conent);
    return file;
  }

  static String jsonReadData(String fileName,
      {Function onDone, Function ISFileOntExist}) {
    getApplicationDocumentsDirectory().then((Directory directory) {
      String path = '${directory.path}/$fileName.json';
      var file = new File(path);

      if (file.existsSync()) {
        String data = file.readAsStringSync();
        if (onDone != null) {
          var d = jsonDecode(data);
          onDone(d, file);
        }
        return file.readAsStringSync();
      } else {
        if (ISFileOntExist != null) {
          ISFileOntExist(path);
        }
        return null;
      }
    });
  }

  static void jsonWriteData(String fileName, List<dynamic> data,
      {Function onDone}) {
    getApplicationDocumentsDirectory().then((Directory directory) {
      String path = '${directory.path}/$fileName.json';
      var file = new File(path);

      if (file.existsSync()) {
        file.writeAsStringSync(jsonEncode(data));
      } else {
        print("create File ");
        file = jsonCreateFile(path, jsonEncode(data));
      }
      if (onDone != null) {
        onDone(file, data);
      }
    });
  }
}
