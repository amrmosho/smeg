import 'package:flutter/material.dart';

class appCart extends StatelessWidget {
  final Widget child;

  const appCart({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: this.child);
  }
}
