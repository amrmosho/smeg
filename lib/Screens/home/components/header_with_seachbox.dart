import 'package:flutter/material.dart';
import 'package:shop_app/app_components/screen_title.dart';
import 'package:shop_app/app_components/search_bar.dart';
import 'package:shop_app/constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefultpadding * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.1,
      child: Stack(children: <Widget>[
        Container(
            padding: EdgeInsets.only(
              left: kDefultpadding,
              right: kDefultpadding,
              bottom: 36 + kDefultpadding,
            ),
            height: size.height * 0.3 - 27,
            child: ScreenTitle(title: "Food", subtitle: "Delevry")),
        SearchBar()
      ]),
    );
  }
}
