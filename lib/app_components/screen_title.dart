import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

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
    Size _size;
    _size = (size == null) ? MediaQuery.of(context).size : size;

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
                        Text(
                          this.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: INSDefultScreenTitleColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text(
                            this.subtitle,
                            style: TextStyle(
                                color: INSDefultTextColor, fontSize: 12),
                          ),
                        ),
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
