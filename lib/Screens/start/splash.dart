import 'package:flutter/material.dart';
import 'package:shop_app/Screens/start/start.dart';
import 'package:shop_app/ins/lang.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/ins/ui/ina_inputs.dart';
import 'package:shop_app/models/data.dart';

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
            t = "No internet used ofline Data";
            break;

          case SheckDataStatus.disconnect:
            t = "Error :( Data need internet to continue";
            goon = false;
            break;

          case SheckDataStatus.sameVersion:
            t = "Data has latest version :)";

            break;
          case SheckDataStatus.updated:
            t = "data updated successfully to latest version";

            break;
        }
        _stat = t;
        if (goon) {
          Navigator.pushNamed(context, StartScreen.id);
        }
      });
    });
  }

  String _stat = "check data....";

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
