import 'package:flutter/material.dart';
import 'package:shop_app/Screens/productScreens/cart/cart.dart';
import 'package:shop_app/Screens/start/start.dart';
import 'package:shop_app/constants.dart';

class Menu extends StatefulWidget {
  final String act;

  const Menu({Key key, this.act}) : super(key: key);

  @override
  _StratScreenState createState() => _StratScreenState(act);
}

class _StratScreenState extends State<Menu> {
  final String act;

  _StratScreenState(this.act);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(INSDefultpadding),
        color: Color(0XFF141414),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/smeg_logo.png",
                  width: 80,
                ),
                Text("Welcome To Smeg")
              ],
            ),
            Column(
              children: [
                MenuItem(
                  text: "home",
                  act: (act == "home"),
                  icon: Icons.home,
                  onpree: () {
                    Navigator.pushNamed(context, StartScreen.id);
                  },
                ),
                MenuItem(
                  text: "Products",
                  act: (act == "Products"),
                  icon: Icons.settings_input_composite,
                ),
                MenuItem(
                  text: "Cart",
                  act: (act == "Cart"),
                  icon: Icons.add_shopping_cart,
                  onpree: () {
                    Navigator.pushNamed(context, CartScreen.id);
                  },
                ),
                MenuItem(
                  text: "home",
                  icon: Icons.home,
                ),
                MenuItem(
                  text: "Contact",
                  act: (act == "Contact"),
                  icon: Icons.contact_mail,
                ),
                MenuItem(
                  text: "about",
                  act: (act == "about"),
                  icon: Icons.info,
                ),
              ],
            ),
            MenuItem(
              text: "Settings / Log out",
              icon: Icons.settings,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onpree;
  final bool act;

  const MenuItem({
    Key key,
    this.icon,
    this.text,
    this.onpree,
    this.act = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GestureDetector(
        onTap: onpree,
        child: Row(
          children: [
            Icon(
              this.icon,
              color: INSDefultTextColor,
              size: act ? 18 : 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                this.text,
                style: TextStyle(
                    color: act ? Colors.white : INSDefultTextColor,
                    fontSize: act ? 15 : 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
