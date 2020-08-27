import 'package:Smeg/app_components/notifications.dart';
import 'package:flutter/material.dart';
import 'package:Smeg/Screens/start/start.dart';
import 'package:Smeg/ins/lang.dart';
import 'package:Smeg/ins/ui/ina_inputs.dart';
import 'package:Smeg/models/data.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    AppData.sheckData(context, stat: (stat) {
      setState(() {
        String t = "";
        bool goon = true;
        switch (stat) {
          case SheckDataStatus.haveData:
            t = INSLang.get("nointernetmsg");
            break;

          case SheckDataStatus.disconnect:
            t = INSLang.get("errormsg");
            goon = false;
            break;

          case SheckDataStatus.sameVersion:
            t = INSLang.get("datalatestversion");

            break;
          case SheckDataStatus.updated:
            t = INSLang.get("updateddatamsg");

            break;
        }
        _stat = t;
        if (goon) {
          Navigator.pushNamed(context, StartScreen.id);
        }
      });
    });
  }

  String _stat = INSLang.get("checkdata");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: INSBTNDefaultBackground,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            child: Center(child: Image.asset("assets/images/smeg_logo.png")),
          ),
          Container(
              height: 100,
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(_stat))
                ],
              )),
        ],
      ),
    );
  }
}
