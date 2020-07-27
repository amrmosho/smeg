import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/Screens/cart/cart.dart';
import 'package:shop_app/Screens/contact/contact.dart';
import 'package:shop_app/Screens/home/home.dart';
import 'package:shop_app/Screens/products/products.dart';
import 'package:shop_app/ins/components/my_bottom_nav_bar.dart';
import 'package:shop_app/Screens/home/components/body.dart';

class StartScreen extends StatefulWidget {
  @override
  _StratScreenState createState() => _StratScreenState();
}

class _StratScreenState extends State<StartScreen> {
  int _index = 0;
  PageController _pageController;
  List<Widget> SubScreens = [
    HomeScreen(),
    ProductesScreen(),
    CartScreen(),
    ConactScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFfafafa),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            //  _index = value;
          });
        },
        controller: _pageController,
        children: SubScreens,
      ),
      bottomNavigationBar: INSNavbar(
        onselected: (index) {
          setState(() {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
            );
          });
        },
        active_index: _index,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }
}

/*
class StartScreen extends StatelessWidget {
  // List<Widget> mypages = {HomeScreen(), ProductesScreen()};

  static String id = "start";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFfafafa),
      body: PageView(
        controller: PageController(initialPage: 1),
        children: [HomeScreen(), ProductesScreen()],
      ),
      bottomNavigationBar: INSNavbar(
        active_index: 0,
      ),
    );
  }
}*/
