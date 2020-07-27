import 'package:flutter/material.dart';

class ConactScreen extends StatelessWidget {
  static String id = "contact";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text("Contact"),
        ),
      ),
    );
  }
}
