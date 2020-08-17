import 'package:flutter/material.dart';

class INSUI {
  static SnackBar snack(BuildContext context, String massage,
      {IconData icon, Color color}) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up, color: color),
          SizedBox(width: 20),
          Text(
            massage,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
    return snackBar;
  }

  static SnackBar successSnack(BuildContext context, String massage) {
    INSUI.snack(context, massage,
        color: Colors.lightGreen, icon: Icons.thumb_up);
  }

  static SnackBar errorSnack(BuildContext context, String massage) {
    INSUI.snack(context, massage, color: Colors.red, icon: Icons.thumb_down);
  }

  static SnackBar warningSnack(BuildContext context, String massage) {
    INSUI.snack(context, massage, color: Colors.orange, icon: Icons.warning);
  }
}
// 'Your order has been sent successfully.'
//Colors.lightGreen
