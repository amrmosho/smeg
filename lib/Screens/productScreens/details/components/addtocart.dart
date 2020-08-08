import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/Screens/productScreens/cart/cart.dart';
import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/models/session.dart';
import 'dart:math' as math;

import 'package:shop_app/constants.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefultpadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: kDefultpadding),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Color(widget.product.color)),
            ),
            child: AnimatedBuilder(
              builder: (BuildContext context, Widget child) {
                return Transform.scale(
                  scale: 1 + _controller.value,
                  child: child,
                );
              },
              animation: _controller,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.id);
                },
                icon: SvgPicture.asset(
                  "assets/icons/cart.svg",
                  color: Color(widget.product.color),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
                height: 50,
                child: FlatButton(
                  color: Color(widget.product.color),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    widget.product.num = SessionCartItemNum;

                    int index =
                        cart.indexWhere((l) => (l.id == widget.product.id));

                    if (index == -1) {
                      cart.add(widget.product);
                    } else {
                      cart[index].num += SessionCartItemNum;
                    }

                    _controller.repeat(min: 1, max: 1);
                    _controller.reverse();
                  },
                  child: Text(
                    " Add To Cart ".toUpperCase(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
