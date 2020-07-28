import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class Menu extends StatefulWidget {
  @override
  _StratScreenState createState() => _StratScreenState();
}

class _StratScreenState extends State<Menu> {
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
                  icon: Icons.home,
                ),
                MenuItem(
                  text: "Products",
                  icon: Icons.settings_input_composite,
                ),
                MenuItem(
                  text: "Cart",
                  icon: Icons.add_shopping_cart,
                ),
                MenuItem(
                  text: "home",
                  icon: Icons.home,
                ),
                MenuItem(
                  text: "Contact",
                  icon: Icons.contact_mail,
                ),
                MenuItem(
                  text: "about",
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

  const MenuItem({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Icon(
            this.icon,
            color: INSDefultTextColor,
            size: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              this.text,
              style: TextStyle(color: INSDefultTextColor, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
