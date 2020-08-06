import 'package:flutter/material.dart';
import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/models/session.dart';

import 'package:shop_app/constants.dart';

class CartCounter extends StatefulWidget {
  final Content product;

  const CartCounter({Key key, this.product}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icon(Icons.remove),
          onpress: () {
            if (SessionCartItemNum > 1) {
              setState(() {
                SessionCartItemNum--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefultpadding / 2),
          child: Text(
            SessionCartItemNum.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
          icon: Icon(Icons.add),
          onpress: () {
            setState(() {
              SessionCartItemNum++;
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
