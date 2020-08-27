import 'dart:convert';

import 'package:Smeg/models/products.dart';

List<Product> cart = [];

class Cart {
  static add(Product product, int Num) {
    int index = cart.indexWhere((l) => (l.id == product.id));

    if (index == -1) {
      product.num = Num;
      cart.add(product);
    } else {
      cart[index].num += Num;
    }
  }

  static remvoe() {}
  static get() {}

  static int gettotalNumber() {
    int r = 0;

    for (Product pro in cart) {
      if (pro.num != null) r += pro.num;
    }

    return r;
  }

  static String getDataJsone() {
    int r = 0;
    var data = {};
    for (Product pro in cart) {
      data[pro.id] = {"id": pro.id, "q": pro.num};
    }

    return jsonEncode(data);
  }

  static int gettotalPrice() {
    int r = 0;
    for (Product pro in cart) {
      if (pro.price != null && pro.num != null) r += (pro.price * pro.num);
    }

    return r;
  }
}
