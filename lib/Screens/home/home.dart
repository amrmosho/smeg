import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/ins/components/my_bottom_nav_bar.dart';
import 'package:shop_app/Screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String id = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFfafafa),
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyNavbar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    );
  }
}
