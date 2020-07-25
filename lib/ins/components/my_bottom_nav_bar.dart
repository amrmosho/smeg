import 'package:flutter/material.dart';
import 'package:shop_app/models/NavBarMenu.dart';
import '../../constants.dart';

class MyNavbar extends StatefulWidget {
  @override
  _MyNavbarState createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];
    for (var i = 0; i < NavMenu.length; i++) {
      data.add(NavbarItem(
        index: i,
        button: NavMenu[i],
        selected: _index,
        onclick: () {
          setState(() {
            if (NavMenu[i].goto == null) {
              Navigator.pushNamed(context, NavMenu[i].goto);
            }
            _index = i;
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
