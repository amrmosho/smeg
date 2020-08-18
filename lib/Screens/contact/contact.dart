import 'package:flutter/material.dart';
import 'package:shop_app/app_components/main_body.dart';
import 'package:shop_app/ins/net.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ConactScreen extends StatefulWidget {
  static String id = "contact";

  @override
  _ConactScreenState createState() => _ConactScreenState();
}

class _ConactScreenState extends State<ConactScreen> {
  String _string = "loading....";
  String data_id = "135";

  @override
  void initState() {
    super.initState();

    INSNet.getJsone(
        addToUrl: "/sys_html/id/" + data_id + "/",
        onDone: (data) {
          setState(() {
            _string = data[0]["content"];
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AppBody(
          child: Container(
              width: double.infinity,
              child: Expanded(child: HtmlWidget(_string))),
        ),
      ),
    );
  }
}
