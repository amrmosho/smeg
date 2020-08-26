import 'package:flutter/material.dart';
import 'package:shop_app/Screens/menu/menu.dart';
import 'package:shop_app/app_components/screen_title.dart';
import 'package:shop_app/ins/lang.dart';
import '../../constants.dart';

class AddMenuScreen extends StatefulWidget {
  final Widget Screen;
  final String title;
  final String subtitle;
  final String act;
  const AddMenuScreen(
      {Key key, this.Screen, this.title, this.subtitle, this.act})
      : super(key: key);

  @override
  _CartScreenState createState() =>
      _CartScreenState(Screen, title, subtitle, act);
}

class _CartScreenState extends State<AddMenuScreen> {
  final Widget Screen;
  final String title;
  final String act;
  final String subtitle;

  double xoffest = 0;
  double yoffest = 0;
  double zoffest = 0;
  double Scale = 1;
  bool menu_opend = false;

  _CartScreenState(this.Screen, this.title, this.subtitle, this.act);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: INSDefultScreenBackground,
      body: Stack(children: [
        Menu(
          act: act,
        ),
        AnimatedContainer(
            color: Colors.black,
            duration: Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xoffest, yoffest, zoffest)
              ..scale(Scale),
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  height: 100,
                  child: ScreenTitle(
                    title: title,
                    subtitle: subtitle,
                    menuicon: menu_opend ? Icons.arrow_back : Icons.menu,
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
                          xoffest = INSLang.isRTL() ? -150 : 230;
                          yoffest = 150;
                          zoffest = 0;
                          Scale = 0.7;
                        }
                      });
                    },
                  ),
                ),
                this.Screen
              ],
            ))
      ]),
    );
  }
}
