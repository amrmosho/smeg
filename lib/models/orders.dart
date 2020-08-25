import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/ins/utils.dart';

class Orders {
  String id, name, email, phone, address, sys_created, status;

  Color status_color;
  Map<String, dynamic> items;

  Orders(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.items,
      this.status,
      this.sys_created,
      this.status_color});

  factory Orders.fromJson(Map<String, dynamic> data) {
    var c = Orders(
        id: data["id"],
        name: data["name"],
        email: data["email"],
        status: data["my_status"],
        status_color: getStatColor(data["my_status"]),
        sys_created: data["sys_created"],
        items: jsonDecode(data["items"]));
    return c;
  }

  static Color getStatColor(String s) {
    Color r = Colors.grey;
    switch (s) {
      case "cancel":
        r = Colors.red;
        break;
      case "done":
        r = Colors.lightGreen;
        break;
    }
    return r;
  }

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "name": name,
      "email": phone,
      "phone": name,
      "items": items,
      "sys_created": sys_created,
      "my_status": status,
      "address": address
    };
  }

  static String file = "com_orders";
  static String type = "com_orders";
  static String query = "device_id/";

  static void update(BuildContext context, {Function onDone}) {
    INSUtils.getDeviceId(context, onDone: (id) {
      query += id + "/";
      INSNet.getJsone(
          addToUrl: "/$type/$query",
          onDone: (data) {
            if (data != false) {
              INSNet.jsonWriteData(type, data, onDone: (file, data) {
                List<Orders> cat_data = List<Orders>.from(
                    data.map((data) => Orders.fromJson(data)).toList());
                if (onDone != null) {
                  onDone(cat_data);
                }
              });
            }
          });
    });
  }

  static String get(BuildContext context, Function onDone) {
    INSNet.jsonReadData(file, onDone: (data, file) {
      List<Orders> cat_data =
          List<Orders>.from(data.map((data) => Orders.fromJson(data)).toList());
      onDone(cat_data);
    }, ISFileOntExist: (path) {
      update(context, onDone: onDone);
    });
  }
}
