import 'package:flutter/material.dart';
import 'package:shop_app/Screens/productScreens/details/details_screen.dart';
import 'package:shop_app/app_components/app_cart.dart';
import 'package:shop_app/app_components/main_body.dart';
import 'package:shop_app/app_components/search_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/lang.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/models/favorite.dart';
import 'package:shop_app/models/orders.dart';
import 'package:shop_app/models/products.dart';

class ProductesScreen extends StatefulWidget {
  static String id = "productes";

  @override
  _ProductesScreenState createState() => _ProductesScreenState();
}

class _ProductesScreenState extends State<ProductesScreen> {
  List<Product> _products = List();
  List<Orders> _orders = List();

  updateFavotire() {
    Favorite.getData((data) {
      setState(() {
        _products = data;
      });
    });
  }

  updateOrder() {
    Orders.get(context, (data) {
      setState(() {
        _orders = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AppBody(
          child: myBody(context),
        ),
      ),
    );
  }

  TextEditingController _textFieldController = TextEditingController();
  var _stat = "Favorites";

  @override
  void initState() {
    super.initState();
    updateFavotire();
  }

  Container myBody(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SearchBar(
            textSearcController: _textFieldController,
            onChanged: (value) {},
            hint: " Search in " + _stat + " ....",
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                myTabButton(context, INSLang.get("favorites")),
                SizedBox(width: 16),
                myTabButton(context, INSLang.get("myorders")),
              ],
            ),
          ),
          _stat == "Favorites" ? favoritesArea() : ordersArea()
        ],
      ),
    );
  }

  Expanded ordersArea() {
    return Expanded(
      child: _products.length > 0
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                return orderItem(index, _orders[index]);
              })
          : Container(),
    );
  }

  Widget orderItem(int index, Orders order) {
    return Expanded(
      child: Stack(alignment: Alignment.topRight, children: [
        appCart(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              order_item(Icons.calendar_today, order.sys_created),
              order_item(Icons.person, order.name),
              order_item(Icons.email, order.email),
              order_item(Icons.shopping_basket, order.items.length.toString()),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(INSDefultpadding / 2),
          padding: EdgeInsets.all(INSDefultpadding / 2),
          decoration: BoxDecoration(
              color: order.status_color,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(INSDefultRadius),
              )),
          child: Text(
            order.status,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        )
      ]),
    );
  }

  Widget order_item(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: INSDefultTextColor,
            size: 20,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            value,
            style: TextStyle(
              color: INSDefultTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Expanded favoritesArea() {
    return Expanded(
      child: _products.length > 0
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: kDefultpadding,
                  crossAxisSpacing: kDefultpadding,
                  crossAxisCount: 2,
                  childAspectRatio: 0.75),
              scrollDirection: Axis.vertical,
              itemCount: _products.length,
              itemBuilder: (context, index) {
                return favoItem(index, _products[index]);
              })
          : Container(),
    );
  }

  GestureDetector myTabButton(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (title == "Favorites" && _products.length == 0) {
            updateFavotire();
          } else {
            updateOrder();
          }

          _stat = title;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline6),
          Container(
              margin: EdgeInsets.only(top: 4),
              height: 3,
              width: 30,
              color: _stat == title ? Color(0Xff666666) : Colors.transparent)
        ],
      ),
    );
  }

  Widget favoItem(int index, Product product) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Container(
            decoration: BoxDecoration(
              color: Color(product.color),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(alignment: Alignment.bottomRight, children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaillsScreen(
                          product: product,
                        ),
                      ),
                    );
                  },
                  child: INSNet.getImage(product.image, heroTag: product.id)),
              GestureDetector(
                onTap: () {
                  Favorite.remove(product.id);
                  setState(() {
                    _products.removeAt(index);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(16)),
                    color: Colors.white.withOpacity(0.95),
                  ),
                  child: Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.red,
                  ),
                ),
              )
            ])),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: INSDefultpadding / 2,
                horizontal: INSDefultpadding / 2),
            child: Text(
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
        ],
      ),
      product.price != 0
          ? Text(
              "\$${product.price}",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          : SizedBox(
              height: 30,
            ),
    ]);
  }
}
