import 'package:Smeg/Screens/start/app.dart';
import 'package:flutter/material.dart';
import 'package:Smeg/Screens/menu/get_menu.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/lang.dart';
import 'package:Smeg/main.dart';

import '../../main.dart';

class SettingsScreen extends StatefulWidget {
  static String id = "SettingsScreen";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _lnag = language;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return AddMenuScreen(
      title: INSLang.get("settings"),
      subtitle: "",
      act: "",
      Screen: Container(
        margin: EdgeInsets.all(8),
        height: s.height - 150,
        padding: EdgeInsets.symmetric(
            vertical: INSDefultpadding, horizontal: INSDefultpadding / 4),
        decoration: BoxDecoration(
          color: Color(0xfff0eef0),
          borderRadius: BorderRadius.all(Radius.circular(INSDefultRadius)),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(INSLang.get("en")),
              leading: Radio(
                value: Language.en,
                groupValue: _lnag,
                onChanged: (value) {
                  INSLang.update_lang(value, onDone: (data) {
                    setState(() {
                      INSLang.update();

                      Navigator.pushNamed(context, AppScreen.id);

                      _lnag = value;
                    });
                  });
                },
              ),
            ),
            ListTile(
              title: Text(INSLang.get("ar")),
              leading: Radio(
                value: Language.ar,
                groupValue: _lnag,
                onChanged: (value) {
                  INSLang.update_lang(value, onDone: (data) {
                    setState(() {
                      INSLang.update();
                      Navigator.pushNamed(context, AppScreen.id);
                      _lnag = value;
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
