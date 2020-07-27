import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class ScreenTitle extends StatelessWidget {
  final title;
  final subtitle;
  final Size size;
  const ScreenTitle({
    Key key,
    this.title,
    this.subtitle,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size;
    _size = (size == null) ? MediaQuery.of(context).size : size;

    return Container(
      // margin: EdgeInsets.only(bottom: kDefultpadding * 2.5),
      height: _size.height * 0.1,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefultpadding,
              right: kDefultpadding,
              bottom: kDefultpadding,
            ),
            height: _size.height * 0.3 - 27,
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: this.title + '\n',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    (this.subtitle != null)
                        ? TextSpan(
                            text: this.subtitle,
                            style: TextStyle(color: kTextColor, fontSize: 12),
                          )
                        : TextSpan(),
                  ]),
                ),
                Spacer(),
                Image.asset("assets/images/logo.png")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
