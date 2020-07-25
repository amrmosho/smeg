import 'package:flutter/material.dart';
import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';

class CartCounter extends StatefulWidget {
  final Content product;

  const CartCounter({Key key, this.product}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int itemsNum = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icon(Icons.remove),
          onpress: () {
            if (itemsNum > 1) {
              setState(() {
                itemsNum--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefultpadding / 2),
          child: Text(
            itemsNum.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
          icon: Icon(Icons.add),
          onpress: () {
            setState(() {
              itemsNum++;
            });
          },
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({Icon icon, Function onpress}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: icon,
        onPressed: onpress,
      ),
    );
  }
}
