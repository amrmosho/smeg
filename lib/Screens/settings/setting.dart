import 'package:flutter/material.dart';
import 'package:shop_app/Screens/menu/get_menu.dart';
import 'package:shop_app/Screens/start/splash.dart';
import 'package:shop_app/app_components/main_body.dart';
import 'package:shop_app/app_components/screen_title.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/lang.dart';

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
    return AddMenuScreen(
        title: INSLang.get("settings"),
        subtitle: "",
        act: "",
        Screen: Container(
          child: AppBody(
            child: Expanded(
              child: AppBody(
                child: settingBody(),
              ),
            ),
          ),
        ));
  }

  Container settingBody() {
    return Container(
        width: double.infinity,
        child: Expanded(
          child: Column(
            children: <Widget>[
              Text(
                INSLang.get("language"),
                style: Theme.of(context).textTheme.headline6,
              ),
              ListTile(
                title: Text(INSLang.get("en")),
                leading: Radio(
                  value: Language.en,
                  groupValue: _lnag,
                  onChanged: (value) {
                    INSLang.update_lang(value, onDone: (data) {
                      setState(() {
                        INSLang.update();
                        RestartWidget.restartApp(context);

                        // Navigator.pushNamed(context, SplashScreen.id);

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
                        RestartWidget.restartApp(context);

                        _lnag = value;
                      });
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
