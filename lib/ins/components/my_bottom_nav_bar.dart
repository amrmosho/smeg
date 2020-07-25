import 'package:flutter/material.dart';
import 'package:shop_app/Screens/products/products.dart';
import 'package:shop_app/models/NavBarMenu.dart';
import '../../constants.dart';

class INSNavbar extends StatefulWidget {
  final int active_index;
  final Function onselected;
  const INSNavbar({Key key, this.onselected, this.active_index})
      : super(key: key);
  @override
  _INSNavbarState createState() =>
      _INSNavbarState(index: active_index, fun: onselected);
}

class _INSNavbarState extends State<INSNavbar> {
  int index;
  final Function fun;
  _INSNavbarState({this.fun, this.index = 0});

  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];
    for (var i = 0; i < NavMenu.length; i++) {
      data.add(NavbarItem(
        index: i,
        button: NavMenu[i],
        selected: index,
        onclick: () {
          setState(() {
            if (NavMenu[i].goto != null) {
              Navigator.pushNamed(context, NavMenu[i].goto);
            }
            this.fun(i);
            index = i;
          });
        },
      ));
    }

    return Container(
      padding: EdgeInsets.only(
        left: INSNavPadding * 2,
        right: INSNavPadding * 2,
        bottom: INSNavPadding,
        top: INSNavPadding,
      ),
      height: INSNavHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(INSBorderRadiusTopLeft),
            topRight: Radius.circular(INSBorderRadiusTopRight),
            bottomLeft: Radius.circular(INSBorderRadiusBottomLeft),
            bottomRight: Radius.circular(INSBorderRadiusBottomRight)),
        color: INSNavBackground,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: INSNavShadowBlur,
            color: INSNavShadowColor.withOpacity(INSNavShadowOpacity),
          ),
        ],
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: data),
    );
  }
}

class NavbarItem extends StatelessWidget {
  final ButtonData button;

  final int index;
  final int selected;
  final Function onclick;
  const NavbarItem(
      {Key key, this.button, this.selected, this.index, this.onclick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool is_selected = false;
    Color _color = INSNavUnSelectedIconBackground;
    Color _icon_color = INSNavUnSelectedIconColor;
    double _text_size = 0.1;
    double _width = 50;
    if (this.index == selected) {
      is_selected = true;
      _color = (this.button.background == null)
          ? INSNavSelectedIconBackground
          : this.button.background;

      _icon_color = (this.button.color == null)
          ? INSNavSelectedIconColor
          : this.button.color;
      _width = 120;
      _text_size = INSNavSelectedIconTextSize;
    }

    return AnimatedContainer(
      width: _width,
      duration: INSAnimtionSpeed,
      decoration: BoxDecoration(
          color: _color, borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
          padding: const EdgeInsets.only(right: 0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Icon(
                      this.button.icon,
                      size: INSNavSelectedIconSize,
                      color: _icon_color,
                    ),
                    onPressed: onclick,
                  ),
                  is_selected
                      ? Text(
                          this.button.title,
                          style: TextStyle(
                            fontSize: INSNavSelectedIconTextSize,
                            color: _icon_color,
                          ),
                        )
                      : Text(""),
                ],
              )
            ],
          )),
    );
  }
}
