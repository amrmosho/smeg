import 'package:flutter/material.dart';
import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/constants.dart';

class ColorsAndSize extends StatelessWidget {
  const ColorsAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Content product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Colors"),
              Row(
                children: [
                  ColorDot(
                    color: Color(0xFF356c95),
                    isSelected: true,
                  ),
                  ColorDot(color: Color(0xFFF8C078)),
                  ColorDot(color: Color(0xFFA29B9B)),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("size"),
              Text("${product.size} cm",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        )
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorDot({Key key, this.color, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: kDefultpadding / 4, right: kDefultpadding / 4),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: this.isSelected ? this.color : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
