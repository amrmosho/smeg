import 'package:flutter/material.dart';
import 'package:Smeg/Screens/menu/get_menu.dart';
import 'package:Smeg/Screens/productScreens/checkout/checkout.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/lang.dart';
import 'package:Smeg/ins/net.dart';
import 'package:Smeg/app_components/main_body.dart';
import 'package:Smeg/models/cart.dart';

class CartScreen extends StatefulWidget {
  static String id = "cart";
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: INSDefultScreenBackground,
      body: AddMenuScreen(
        title: INSLang.get("cart"),
        act: "Cart",
        Screen: cartBody(this),
      ),
    );
  }
}

class cartBody extends StatelessWidget {
  final _CartScreenState p;

  const cartBody(
    this.p, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(INSDefultRadius)),
          ),
          child: Column(
            children: [
              CartBody(p),
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: INSDefultpadding / 2,
                      horizontal: INSDefultpadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(fontSize: 16, height: 1.5),
                              children: [
                                Cart.gettotalNumber() > 0
                                    ? TextSpan(
                                        text: INSLang.get("number"),
                                      )
                                    : TextSpan(text: ""),
                                Cart.gettotalNumber() > 0
                                    ? TextSpan(
                                        text: Cart.gettotalNumber().toString() +
                                            "\n")
                                    : TextSpan(text: ""),
                                Cart.gettotalPrice() > 0
                                    ? TextSpan(text: INSLang.get("total"))
                                    : TextSpan(text: ""),
                                Cart.gettotalPrice() > 0
                                    ? TextSpan(
                                        text: Cart.gettotalPrice().toString() +
                                            "\n")
                                    : TextSpan(text: ""),
                              ]),
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: kPrimaryColor,
                        onPressed: () {
                          Navigator.pushNamed(context, CheckoutScreen.id);
                        },
                        child: Text(
                          INSLang.get("sendinquiry"),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  height: 54)
            ],
          ),
        )
      ],
    );
  }
}

class CartBody extends StatefulWidget {
  final _CartScreenState parent;

  const CartBody(this.parent, {Key key}) : super(key: key);
  @override
  _CartBodyState createState() => _CartBodyState(parent);
}

class _CartBodyState extends State<CartBody> {
  final _CartScreenState parent;
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  _CartBodyState(this.parent);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return AppBody(
      height: s.height - 200,
      child: AnimatedList(
        key: _key,
        initialItemCount: cart.length,
        itemBuilder: (context, index, animation) {
          return CartItem(index, animation);
        },
      ),
    );
  }

  Widget CartItem(int index, Animation animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 2,
        child: Container(
          margin: EdgeInsets.only(
              top: INSDefultpadding / 4,
              bottom: INSDefultpadding / 4,
              left: INSDefultpadding / 4,
              right: INSDefultpadding / 4),
          padding: EdgeInsets.all(INSDefultpadding / 4),
          height: 120,
          child: Row(
            children: [
              Expanded(flex: 1, child: INSNet.getImage(cart[index].image)),
              Expanded(
                flex: 2,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: cart[index].price.toString(),
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                    text: cart[index].title + "\n",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                CounterArea(index),
                              ],
                            ),
                          ),
                        ),
                        buildOutlineButton(
                          icon: Icon(Icons.delete),
                          background: Colors.red,
                          onpress: () {
                            this.parent.setState(() {
                              _removeitem(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding CounterArea(int index) {
    cart[index].num = (cart[index].num == null) ? 1 : cart[index].num;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildOutlineButton(
            icon: Icon(Icons.remove),
            onpress: () {
              if (cart[index].num > 1) {
                setState(() {
                  cart[index].num -= 1;
                });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefultpadding / 2),
            child: Text(
              cart[index].num.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          buildOutlineButton(
            icon: Icon(Icons.add),
            onpress: () {
              setState(() {
                cart[index].num += 1;
              });
            },
          ),
        ],
      ),
    );
  }

  void _removeitem(int index) {
    _key.currentState
        .removeItem(index, (context, animation) => CartItem(index, animation));
    cart.removeAt(index);
  }
}

Container buildOutlineButton(
    {Icon icon, Function onpress, Color background, Color color}) {
  return Container(
    width: 35,
    height: 35,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
        color: (background == null) ? Colors.black : background,
        borderRadius: BorderRadius.all(Radius.circular(25))),
    child: IconButton(
      icon: icon,
      iconSize: 15,
      color: (color == null) ? Colors.white : color,
      onPressed: onpress,
    ),
  );
}
