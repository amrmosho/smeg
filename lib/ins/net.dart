import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class INSNet {
  static String url = "http://smeg.sys4me.com/insapi/";
  static String images_url = "http://smeg.sys4me.com/ins_upload/";

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

  static Future<File> downloadFile(String url, String filename,
      {Function onDone}) async {
    http.Client client = new http.Client();
    var req = await client.get(Uri.parse(url));
    var bytes = req.bodyBytes;
    String dir = (await getApplicationDocumentsDirectory()).path;
    String path = '$dir/$filename';
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    if (onDone != null) {
      onDone(path);
    }
    return file;
  }

  static Future<File> get_image(String filename, {Function onDone}) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String path = '$dir/$filename';
    File file = new File('$dir/$filename');

    if (!file.existsSync()) {
      String url = images_url + filename;
      http.Client client = new http.Client();
      var req = await client.get(Uri.parse(url));
      var bytes = req.bodyBytes;
      await file.writeAsBytes(bytes);
    }

    if (onDone != null) {
      onDone(path);
    }
    return file;
  }

  static Widget getImage(String filename,
      {double height, double padding = 8, Function onDone, String heroTag}) {
    return FutureBuilder(
      future: INSNet.get_image(filename),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            height: height,
            padding: EdgeInsets.all(padding),
            child: (heroTag == null)
                ? Image.file(
                    snapshot.data,
                    fit: BoxFit.fitHeight,
                  )
                : Hero(
                    tag: "${heroTag}",
                    child: Image.file(
                      snapshot.data,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  static Future<bool> is_connected({Function onCheck}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        onCheck(true);
        return true;
      }
    } on SocketException catch (_) {
      onCheck(false);
      return false;
    }
  }
}
