import 'package:shop_app/models/products.dart';

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

  static String gettotalNumber() {
    int r = 0;

    for (Product pro in cart) {
      if (pro.num != null) r += pro.num;
    }

    return r.toString();
  }

  static String gettotalPrice() {
    int r = 0;
    for (Product pro in cart) {
      if (pro.price != null && pro.num != null) r += (pro.price * pro.num);
    }

    return r.toString();
  }
}
