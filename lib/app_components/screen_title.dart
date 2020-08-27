import 'package:Smeg/app_components/text.dart';
import 'package:Smeg/ins/lang.dart';
import 'package:flutter/material.dart';
import 'package:Smeg/constants.dart';

class ScreenTitle extends StatelessWidget {
  final title;
  final subtitle;
  final Size size;
  final Function onMenuPress;
  final IconData menuicon;

  const ScreenTitle({
    Key key,
    this.title,
    this.subtitle,
    this.size,
    this.onMenuPress,
    this.menuicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size _size = (size == null) ? MediaQuery.of(context).size : size;

    return Container(
      // margin: EdgeInsets.only(bottom: kDefultpadding * 2.5),
      height: 90,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 5,
              left: INSDefultpadding,
              right: kDefultpadding,
              bottom: kDefultpadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: onMenuPress,
                  child: Icon(
                    this.menuicon != null ? this.menuicon : Icons.menu,
                    color: INSDefultTextColor,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        INSTitle(text: this.title),
                        this.subtitle != null
                            ? Padding(
                                padding: INSLang.isRTL()
                                    ? EdgeInsets.only(right: 16)
                                    : EdgeInsets.only(left: 16),
                                child: INSSubTitle(text: this.subtitle),
                              )
                            : Container(),
                      ],
                    )),
                Image.asset(
                  "assets/images/smeg_logo.png",
                  width: 180,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
