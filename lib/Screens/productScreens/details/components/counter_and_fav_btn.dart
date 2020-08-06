import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/Screens/productScreens/details/components/cat_conter.dart';
import 'package:shop_app/ins/data_types.dart';

class CounterAndFavBtn extends StatelessWidget {
  const CounterAndFavBtn({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Content product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(product: product),
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFF6464),
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        )
      ],
    );
  }
}
