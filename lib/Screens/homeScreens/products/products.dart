import 'package:flutter/material.dart';
import 'package:shop_app/Screens/productScreens/details/details_screen.dart';
import 'package:shop_app/app_components/main_body.dart';
import 'package:shop_app/app_components/search_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/models/favorite.dart';
import 'package:shop_app/models/products.dart';

class ProductesScreen extends StatefulWidget {
  static String id = "productes";

  @override
  _ProductesScreenState createState() => _ProductesScreenState();
}

class _ProductesScreenState extends State<ProductesScreen> {
  List<Product> _products = List();

  @override
  void initState() {
    super.initState();
    updateFavotire();
  }

  updateFavotire() {
    Favorite.getData((data) {
      setState(() {
        _products = data;
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

  Container myBody(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SearchBar(
            textSearcController: _textFieldController,
            onChanged: (value) {},
            hint: " Search in ....",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text("My Favorites",
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(width: 30),
                Text("My Orders", style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
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
          )
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
