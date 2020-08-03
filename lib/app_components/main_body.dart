import 'package:flutter/material.dart';
import '../constants.dart';

class AppBody extends StatelessWidget {
  final Widget child;
  final double height;

  const AppBody({
    Key key,
    this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Container(
        height: (height == null) ? s.height - 150 : height,
        padding: EdgeInsets.symmetric(
            vertical: INSDefultpadding, horizontal: INSDefultpadding / 4),
        decoration: BoxDecoration(
          color: Color(0xfff0eef0),
          borderRadius: BorderRadius.all(Radius.circular(INSDefultRadius)),
        ),
        child: child);
  }
}
