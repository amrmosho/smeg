import 'package:flutter/material.dart';
import 'package:shop_app/ins/ui/ina_inputs.dart';
import 'package:shop_app/models/NavBarMenu.dart';
import '../../constants.dart';
import '../data_types.dart';

const double INSNavSelectedWidth = 120;

const INSNavUnSelectedIconColor = INSDefultTextColor;
const INSNavUnSelectedIconBackground = Colors.white;
const double INSNavUnSelectedFontSize = 0.1;
const double INSNavUnSelectedWidth = 50;

const Duration INSAnimtionSpeed = Duration(milliseconds: 270);

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
      margin: EdgeInsets.only(
        left: INSNavMarginH,
        right: INSNavMarginH,
        bottom: INSNavMarginV,
        top: INSNavMarginV,
      ),
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

  final Color btn_icon_color;
  final double btn_icon_size;
  final double btn_text_size;
  final Color btn_text_color;
  final Color btn_background;
  final double btn_border_radius;

  const NavbarItem(
      {Key key,
      this.button,
      this.selected,
      this.index,
      this.onclick,
      this.btn_icon_color,
      this.btn_icon_size,
      this.btn_text_size,
      this.btn_text_color,
      this.btn_background,
      this.btn_border_radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool is_selected = true;

    double _width = INSNavSelectedWidth;
    if (this.index != selected) {
      is_selected = false;
      _width = INSNavUnSelectedWidth;
    }

    return AnimatedContainer(
        width: _width,
        duration: INSAnimtionSpeed,
        child: INSButton(
          this.button,
          icon_color: is_selected ? btn_icon_color : INSNavUnSelectedIconColor,
          icon_size: btn_icon_size,
          text_size: is_selected ? btn_text_size : INSNavUnSelectedFontSize,
          text_color: is_selected ? btn_text_color : INSNavUnSelectedIconColor,
          background:
              is_selected ? btn_background : INSNavUnSelectedIconBackground,
          border_radius: btn_border_radius,
          onclick: onclick,
        ));
  }
}
