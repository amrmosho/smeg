import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/lang.dart';

class INSText extends StatelessWidget {
  final Widget child;

  const INSText({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: INSLang.isRTL() ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding),
            width: double.infinity,
            child: child));
  }
}
