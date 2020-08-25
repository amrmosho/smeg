import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/Screens/contact/contact.dart';
import 'package:shop_app/Screens/homeScreens/home/home.dart';
import 'package:shop_app/Screens/homeScreens/news/news.dart';
import 'package:shop_app/Screens/homeScreens/products/products.dart';
import 'package:shop_app/Screens/menu/menu.dart';
import 'package:shop_app/app_components/screen_title.dart';
import 'package:shop_app/ins/components/my_bottom_nav_bar.dart';
import 'package:shop_app/ins/lang.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/models/content_categories.dart';
import 'package:shop_app/models/data.dart';

class StartScreen extends StatefulWidget {
  static String id = "start";
  @override
  _StratScreenState createState() => _StratScreenState();
}

class _StratScreenState extends State<StartScreen> {
  int _index = 0;
  PageController _pageController;
  List<Widget> SubScreens = [
    HomeScreen(),
    ProductesScreen(),
    NewsScreen(),
    ConactScreen()
  ];

  double xoffest = 0;
  double yoffest = 0;
  double zoffest = 0;
  double Scale = 1;

  bool menu_opend = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Menu(),
        AnimatedContainer(
          color: Colors.black,
          duration: Duration(milliseconds: 250),
          transform: Matrix4.translationValues(xoffest, yoffest, zoffest)
            ..scale(Scale),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ScreenTitle(
                      menuicon: menu_opend ? Icons.arrow_back : Icons.menu,
                      title: "Home",
                      subtitle: " Welcome Back",
                      onMenuPress: () {
                        setState(() {
                          if (menu_opend) {
                            menu_opend = false;
                            xoffest = 0;
                            yoffest = 0;
                            zoffest = 0;
                            Scale = 1;
                          } else {
                            menu_opend = true;
                            xoffest = INSLang.isRTL() ? -230 : 230;
                            yoffest = 150;
                            zoffest = 0;
                            Scale = 0.7;
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 90),
                    child: PageView(
                      onPageChanged: (value) {
                        setState(() {
                          //  _index = value;
                        });
                      },
                      controller: _pageController,
                      children: SubScreens,
                    ),
                  ),
                ],
              ),
              INSNavbar(
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
            ],
          ),
        )
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }
}
